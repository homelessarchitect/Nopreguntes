import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/presentation/theme.dart';
import 'package:admin_app/features/inventory/inventory_view_model.dart';
import 'package:uuid/uuid.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/domain/models/customer.dart';
import 'package:shared/domain/models/product.dart';
import 'package:admin_app/features/customers/customers_view_model.dart';
import 'package:admin_app/features/menu_editor/menu_editor_view_model.dart';
import 'package:admin_app/features/dashboard/dashboard_view_model.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  final WeeklyAvailability? availability;
  const InventoryScreen({super.key, this.availability});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  late final TextEditingController _sabadoController;
  late final TextEditingController _domingoController;
  bool _isPublished = true;

  @override
  void initState() {
    super.initState();
    _sabadoController = TextEditingController(
      text: widget.availability?.saturdayCapacity.toString() ?? '4',
    );
    _domingoController = TextEditingController(
      text: widget.availability?.sundayCapacity.toString() ?? '10',
    );
    _isPublished = widget.availability?.isPublished ?? true;
  }

  @override
  void dispose() {
    _sabadoController.dispose();
    _domingoController.dispose();
    super.dispose();
  }

  void _saveAvailability(WeeklyAvailability? currentAvail) async {
    final sabadoCap = int.tryParse(_sabadoController.text) ?? 0;
    final domingoCap = int.tryParse(_domingoController.text) ?? 0;

    final now = DateTime.now();
    final saturday =
        currentAvail?.startDate ??
        now.add(Duration(days: DateTime.saturday - now.weekday));
    final sunday =
        currentAvail?.endDate ??
        now.add(Duration(days: DateTime.sunday - now.weekday));

    final availability = WeeklyAvailability(
      id: currentAvail?.id ?? const Uuid().v4(),
      startDate: saturday,
      endDate: sunday,
      saturdayCapacity: sabadoCap,
      sundayCapacity: domingoCap,
      saturdayReserved: currentAvail?.saturdayReserved ?? 0,
      sundayReserved: currentAvail?.sundayReserved ?? 0,
      isPublished: _isPublished,
    );

    try {
      await ref
          .read(inventoryViewModelProvider.notifier)
          .publishAvailability(availability);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Disponibilidad actualizada.')),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availabilityAsync = ref.watch(adminAvailabilityProvider);
    final currentAvail = availabilityAsync.valueOrNull ?? widget.availability;
    final availabilityId = currentAvail?.id;
    final reservationsAsync = availabilityId != null
        ? ref.watch(weeklyReservationsProvider(availabilityId))
        : const AsyncValue.data(<Reservation>[]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar Semana'),
        backgroundColor: AppTheme.primaryCoffee,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Capacidad de la Semana',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _sabadoController,
                      decoration: const InputDecoration(
                        labelText: 'Capacidad Sábado',
                        suffixIcon: Icon(Icons.cake),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _domingoController,
                      decoration: const InputDecoration(
                        labelText: 'Capacidad Domingo',
                        suffixIcon: Icon(Icons.cake),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text(
                  'Publicar disponibilidad',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Si está desactivado, la landing mostrará "Agenda cerrada"',
                ),
                value: _isPublished,
                activeThumbColor: AppTheme.primaryCoffee,
                onChanged: (val) => setState(() => _isPublished = val),
              ),
              const SizedBox(height: 32),
              _buildReservationSection(
                context,
                'Reservas del Sábado',
                DateTime.saturday,
                reservationsAsync,
                currentAvail,
              ),
              const SizedBox(height: 24),
              _buildReservationSection(
                context,
                'Reservas del Domingo',
                DateTime.sunday,
                reservationsAsync,
                currentAvail,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (context, ref, child) {
                    final isLoading = ref.watch(inventoryViewModelProvider);
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () => _saveAvailability(currentAvail),
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Guardar'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationSection(
    BuildContext context,
    String title,
    int weekday,
    AsyncValue<List<Reservation>> reservationsAsync,
    WeeklyAvailability? currentAvail,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: AppTheme.primaryCoffee),
              onPressed: () {
                if (currentAvail == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Guarda la capacidad primero.'),
                    ),
                  );
                  return;
                }
                _showAddReservationDialog(context, weekday, currentAvail);
              },
            ),
          ],
        ),
        reservationsAsync.when(
          data: (reservations) {
            final filtered = reservations
                .where((r) => r.deliveryDate.weekday == weekday)
                .toList();

            if (filtered.isEmpty) {
              return const Text(
                'Sin reservas anotadas',
                style: TextStyle(color: Colors.grey),
              );
            }

            return Column(
              children: filtered
                  .map(
                    (r) => Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        title: Text(r.customerName),
                        subtitle: Text(
                          r.items
                              .map((i) => '${i.quantity}x ${i.productName}')
                              .join(', '),
                        ),
                        trailing: Text('\$${r.totalPrice}'),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Text('Error: $e'),
        ),
      ],
    );
  }

  void _showAddReservationDialog(
    BuildContext context,
    int weekday,
    WeeklyAvailability currentAvail,
  ) {
    showDialog(
      context: context,
      builder: (context) => ReservationDialog(
        availabilityId: currentAvail.id,
        weekday: weekday,
        startDate: currentAvail.startDate,
      ),
    );
  }
}

class ReservationDialog extends ConsumerStatefulWidget {
  final String availabilityId;
  final int weekday;
  final DateTime startDate;

  const ReservationDialog({
    super.key,
    required this.availabilityId,
    required this.weekday,
    required this.startDate,
  });

  @override
  ConsumerState<ReservationDialog> createState() => _ReservationDialogState();
}

class _ReservationDialogState extends ConsumerState<ReservationDialog> {
  Customer? selectedCustomer;
  final Map<String, int> selectedProducts = {}; // productId -> quantity

  @override
  Widget build(BuildContext context) {
    final customersAsync = ref.watch(customersProvider);
    final categoriesAsync = ref.watch(adminCategoriesProvider);

    return AlertDialog(
      title: const Text('Nueva Reserva'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cliente',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            customersAsync.when(
              data: (customers) => DropdownButton<Customer>(
                isExpanded: true,
                hint: const Text('Seleccionar Cliente'),
                value: selectedCustomer,
                items: customers
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                    .toList(),
                onChanged: (val) => setState(() => selectedCustomer = val),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text('Error al cargar clientes: $e'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Productos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            categoriesAsync.when(
              data: (categories) => Column(
                children: categories
                    .expand(
                      (cat) => cat.products.map(
                        (p) => CheckboxListTile(
                          title: Text(p.name),
                          subtitle: Text(cat.name),
                          value: selectedProducts.containsKey(p.id),
                          onChanged: (selected) {
                            setState(() {
                              if (selected == true) {
                                selectedProducts[p.id] = 1;
                              } else {
                                selectedProducts.remove(p.id);
                              }
                            });
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (e, s) => Text('Error al cargar productos: $e'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: (selectedCustomer == null || selectedProducts.isEmpty)
              ? null
              : () async {
                  final products =
                      ref.read(adminCategoriesProvider).value ?? [];
                  final reservationItems = <ReservationItem>[];
                  int total = 0;

                  selectedProducts.forEach((pId, qty) {
                    // Find product and category to get price
                    for (final cat in products) {
                      final p = cat.products.cast<Product?>().firstWhere(
                        (p) => p?.id == pId,
                        orElse: () => null,
                      );
                      if (p != null) {
                        reservationItems.add(
                          ReservationItem(
                            productId: p.id,
                            productName: p.name,
                            quantity: qty,
                            unitPrice: cat.basePrice + (p.additionalPrice ?? 0),
                          ),
                        );
                        total +=
                            (cat.basePrice + (p.additionalPrice ?? 0)) * qty;
                        break;
                      }
                    }
                  });

                  final deliveryDate = widget.startDate.add(
                    Duration(days: widget.weekday - widget.startDate.weekday),
                  );

                  final reservation = Reservation(
                    id: const Uuid().v4(),
                    availabilityId: widget.availabilityId,
                    customerId: selectedCustomer!.id,
                    customerName: selectedCustomer!.name,
                    customerPhone: selectedCustomer!.phone,
                    deliveryDate: deliveryDate,
                    items: reservationItems,
                    totalPrice: total,
                  );

                  await ref
                      .read(inventoryViewModelProvider.notifier)
                      .createReservation(reservation);
                  if (context.mounted) Navigator.pop(context);
                },
          child: const Text('Crear'),
        ),
      ],
    );
  }
}
