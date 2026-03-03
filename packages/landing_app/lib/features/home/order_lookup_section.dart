import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/presentation/theme.dart';
import 'package:landing_app/features/home/order_lookup_view_model.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderLookupSection extends ConsumerWidget {
  const OrderLookupSection({super.key});

  void _openWhatsApp() async {
    const phone = '573186062609';
    const message = 'Hola! Me gustaría apartar un postre 🍰';
    final url = Uri.parse(
      'https://wa.me/$phone?text=${Uri.encodeComponent(message)}',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final resultsAsync = ref.watch(orderLookupViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Aparta tu pedido',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: AppTheme.primaryCoffee,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Escríbenos directamente para confirmar disponibilidad y coordinar tu entrega.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.primaryCoffee,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        InkWell(
          onTap: _openWhatsApp,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEAE6E1),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.8),
                  offset: const Offset(-8, -8),
                  blurRadius: 16,
                ),
                BoxShadow(
                  color: AppTheme.primaryCoffee.withValues(alpha: 0.15),
                  offset: const Offset(8, 8),
                  blurRadius: 16,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  color: AppTheme.primaryCoffee,
                  size: 28,
                ),
                SizedBox(width: 16),
                Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppTheme.primaryCoffee,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 60),
        const Divider(color: Color(0xFFDCD5CE), thickness: 1),
        const SizedBox(height: 40),
        const Text(
          '¿Ya apartaste tu pedido?',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryCoffee,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Consulta el estado ingresando tu teléfono o nombre.',
          style: TextStyle(color: AppTheme.textLight, fontSize: 14),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE6E1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.5),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: AppTheme.primaryCoffee.withValues(alpha: 0.05),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Ej: 3001234567...',
                    hintStyle: TextStyle(
                      color: AppTheme.primaryCoffee.withValues(alpha: 0.4),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(orderLookupViewModelProvider.notifier)
                    .search(searchController.text.trim());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryCoffee,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
              ),
              child: const Text('Buscar'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        resultsAsync.when(
          data: (reservations) {
            if (reservations == null) return const SizedBox.shrink();
            if (reservations.isEmpty) {
              return const Text(
                'No se encontraron pedidos con esa información.',
                style: TextStyle(color: Colors.red),
              );
            }

            return Column(
              children: reservations
                  .map((res) => _ReservationResultCard(reservation: res))
                  .toList(),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Text('Error al buscar: $e'),
        ),
      ],
    );
  }
}

class _ReservationResultCard extends StatelessWidget {
  final Reservation reservation;

  const _ReservationResultCard({required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pedido #${reservation.id.substring(0, 8)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                      reservation.status,
                    ).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    reservation.status.toUpperCase(),
                    style: TextStyle(
                      color: _getStatusColor(reservation.status),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ...reservation.items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item.quantity}x ${item.productName}'),
                    Text('\$${item.unitPrice * item.quantity}'),
                  ],
                ),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${reservation.totalPrice}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryCoffee,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Entrega: ${reservation.deliveryDate.day}/${reservation.deliveryDate.month}/${reservation.deliveryDate.year}',
              style: const TextStyle(fontSize: 12, color: AppTheme.textLight),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
