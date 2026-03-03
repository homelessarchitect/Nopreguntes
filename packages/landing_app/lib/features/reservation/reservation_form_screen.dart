import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landing_app/features/home/home_view_model.dart';
import 'package:landing_app/features/reservation/reservation_view_model.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/presentation/theme.dart';

class ReservationFormScreen extends ConsumerStatefulWidget {
  const ReservationFormScreen({super.key});

  @override
  ConsumerState<ReservationFormScreen> createState() =>
      _ReservationFormScreenState();
}

class _ReservationFormScreenState extends ConsumerState<ReservationFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final availabilityAsync = ref.read(currentAvailabilityProvider);
      final availability = availabilityAsync.valueOrNull;

      if (availability == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No hay disponibilidad actualmente.')),
        );
        return;
      }

      // Hardcoded item for demo purpose, the user would normally select it
      final items = [
        const ReservationItem(
          productId: 'demo',
          productName: 'Ponque Clásico',
          quantity: 1,
          unitPrice: 11900,
        ),
      ];

      try {
        await ref
            .read(reservationViewModelProvider.notifier)
            .submitReservation(
              availabilityId: availability.id,
              name: _nameController.text,
              phone: _phoneController.text,
              address: _addressController.text,
              deliveryDate: _selectedDate,
              items: items,
              totalPrice: 11900,
            );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              '¡Reserva confirmada con éxito!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        Navigator.pop(context);
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: ${e.toString()}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apartar mi postre',
          style: TextStyle(fontFamily: 'PlayfairDisplay'),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppTheme.primaryCoffee,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detalles de tu pedido',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nombre completo'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingresa tu nombre' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Celular / WhatsApp',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Ingresa tu celular' : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Dirección de envío',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Ingresa tu dirección' : null,
              ),
              const SizedBox(height: 32),

              Text(
                '¿Para cuándo lo quieres?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _DateSelector(
                      title: 'Sábado',
                      subtitle: 'Entrega 11am-4pm',
                      isSelected: _selectedDate.weekday == DateTime.saturday,
                      onTap: () {
                        setState(() {
                          _selectedDate = DateTime.now().add(
                            Duration(
                              days: DateTime.saturday - DateTime.now().weekday,
                            ),
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _DateSelector(
                      title: 'Domingo',
                      subtitle: 'Entrega 11am-4pm',
                      isSelected: _selectedDate.weekday == DateTime.sunday,
                      onTap: () {
                        setState(() {
                          _selectedDate = DateTime.now().add(
                            Duration(
                              days: DateTime.sunday - DateTime.now().weekday,
                            ),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: Consumer(
                  builder: (context, ref, child) {
                    final isSubmitting = ref.watch(
                      reservationViewModelProvider,
                    );
                    return ElevatedButton(
                      onPressed: isSubmitting ? null : _submitForm,
                      child: isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('Confirmar Reserva'),
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
}

class _DateSelector extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateSelector({
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryCoffee : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryCoffee
                : AppTheme.textLight.withValues(alpha: 0.3),
            width: 2,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.primaryCoffee.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: isSelected ? Colors.white70 : AppTheme.textLight,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
