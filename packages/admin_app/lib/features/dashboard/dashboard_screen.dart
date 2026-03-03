import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/presentation/theme.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:admin_app/features/dashboard/dashboard_view_model.dart';
import 'package:admin_app/features/inventory/inventory_screen.dart';
import 'package:admin_app/features/menu_editor/menu_editor_screen.dart';
import 'package:admin_app/providers/auth_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availabilityAsync = ref.watch(adminAvailabilityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin | No Preguntes',
          style: TextStyle(fontFamily: 'PlayfairDisplay'),
        ),
        backgroundColor: AppTheme.primaryCoffee,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MenuEditorScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await ref.read(adminAuthRepositoryProvider).signOut();
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error al cerrar sesión: $e')),
                );
              }
            },
            tooltip: 'Cerrar sesión',
          ),
        ],
      ),
      body: availabilityAsync.when(
        data: (availability) {
          if (availability == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No hay disponibilidad configurada'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const InventoryScreen(),
                        ),
                      );
                    },
                    child: const Text('Crear Disponibilidad'),
                  ),
                ],
              ),
            );
          }
          return _ActiveWeekDashboard(availability: availability);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  InventoryScreen(availability: availabilityAsync.valueOrNull),
            ),
          );
        },
        backgroundColor: AppTheme.accentGold,
        child: const Icon(Icons.settings),
      ),
    );
  }
}

class _ActiveWeekDashboard extends ConsumerWidget {
  final WeeklyAvailability availability;

  const _ActiveWeekDashboard({required this.availability});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationsAsync = ref.watch(reservationsProvider(availability.id));

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resumen de la semana',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  title: 'Sábado',
                  reserved: availability.saturdayReserved,
                  total: availability.saturdayCapacity,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _StatCard(
                  title: 'Domingo',
                  reserved: availability.sundayReserved,
                  total: availability.sundayCapacity,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'Pedidos Anotados',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: reservationsAsync.when(
              data: (reservations) {
                if (reservations.isEmpty) {
                  return const Center(child: Text('Aún no hay reservaciones.'));
                }
                return ListView.builder(
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final res = reservations[index];
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(
                          res.customerName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${res.customerPhone} • ${res.deliveryDate.weekday == DateTime.saturday ? "Sábado" : "Domingo"}',
                        ),
                        trailing: Text(
                          '\$${res.totalPrice}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryCoffee,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error cargando pedidos')),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final int reserved;
  final int total;

  const _StatCard({
    required this.title,
    required this.reserved,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.textLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$reserved / $total',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryCoffee,
            ),
          ),
        ],
      ),
    );
  }
}
