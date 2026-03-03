import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:landing_app/features/home/home_view_model.dart';
import 'package:shared/presentation/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:landing_app/features/home/order_lookup_section.dart';

const Color _bgColor = Color(0xFFEAE6E1);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return const _DesktopHomeScreen();
          }
          return const _MobileHomeScreen();
        },
      ),
    );
  }
}

class _MobileHomeScreen extends StatelessWidget {
  const _MobileHomeScreen();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _ModernHeaderSection()),
        const SliverToBoxAdapter(child: _ModernReservationSection()),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: OrderLookupSection(),
          ),
        ),
        const SliverToBoxAdapter(child: _ModernMenuSection()),
        const SliverToBoxAdapter(child: SizedBox(height: 100)),
        const SliverToBoxAdapter(child: _FooterSection()),
      ],
    );
  }
}

class _DesktopHomeScreen extends StatefulWidget {
  const _DesktopHomeScreen();

  @override
  State<_DesktopHomeScreen> createState() => _DesktopHomeScreenState();
}

class _DesktopHomeScreenState extends State<_DesktopHomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _scrollToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _OrganicBackground(),
        Column(
          children: [
            _DesktopAppBar(
              currentPage: _currentPage,
              onPageSelected: _scrollToPage,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
                children: [
                  const Center(
                    child: SingleChildScrollView(child: _ModernHeaderSection()),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: const _ModernReservationSection(),
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: const _ModernMenuSection(),
                      ),
                    ),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: const OrderLookupSection(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const _FooterSection(),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageSelected;

  const _DesktopAppBar({
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => onPageSelected(0),
            child: const Row(
              children: [
                Icon(Icons.cake, color: AppTheme.primaryCoffee, size: 28),
                SizedBox(width: 12),
                Text(
                  'NO PREGUNTES',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                    color: AppTheme.primaryCoffee,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _NavButton(
                label: 'INICIO',
                isActive: currentPage == 0,
                onTap: () => onPageSelected(0),
              ),
              const SizedBox(width: 40),
              _NavButton(
                label: 'DISPONIBILIDAD',
                isActive: currentPage == 1,
                onTap: () => onPageSelected(1),
              ),
              const SizedBox(width: 40),
              _NavButton(
                label: 'MENÚ',
                isActive: currentPage == 2,
                onTap: () => onPageSelected(2),
              ),
              const SizedBox(width: 40),
              _NavButton(
                label: 'APARTAR PEDIDO',
                isActive: currentPage == 3,
                onTap: () => onPageSelected(3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isActive ? FontWeight.w900 : FontWeight.w500,
              color: AppTheme.primaryCoffee,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive ? 20 : 0,
            height: 2,
            color: AppTheme.primaryCoffee,
          ),
        ],
      ),
    );
  }
}

class _OrganicBackground extends StatelessWidget {
  const _OrganicBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: CustomPaint(painter: _BlobPainter()));
  }
}

class _BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primaryCoffee.withValues(alpha: 0.05)
      ..style = PaintingStyle.fill;

    final path1 = Path();
    path1.moveTo(size.width * 0.7, 0);
    path1.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.1,
      size.width,
      size.height * 0.3,
    );
    path1.lineTo(size.width, 0);
    path1.close();
    canvas.drawPath(path1, paint);

    final paint2 = Paint()
      ..color = AppTheme.primaryCoffee.withValues(alpha: 0.08)
      ..style = PaintingStyle.fill;

    final path2 = Path();
    path2.moveTo(0, size.height * 0.6);
    path2.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.8,
      size.width * 0.4,
      size.height,
    );
    path2.lineTo(0, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);

    canvas.drawCircle(
      Offset(size.width * 0.15, size.height * 0.25),
      100,
      paint..color = AppTheme.primaryCoffee.withValues(alpha: 0.03),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ModernHeaderSection extends StatelessWidget {
  const _ModernHeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: _bgColor,
              shape: BoxShape.circle,
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
            child: Image.asset(
              'assets/no_preguntes_logo.png',
              package: 'shared',
              height: 100,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.cake,
                size: 80,
                color: AppTheme.primaryCoffee,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            'no preguntes',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              letterSpacing: 2,
              color: AppTheme.primaryCoffee,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: _bgColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.8),
                  offset: const Offset(-4, -4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: AppTheme.primaryCoffee.withValues(alpha: 0.1),
                  offset: const Offset(4, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: const Text(
              'SOLO GOZALO',
              style: TextStyle(
                letterSpacing: 6,
                color: AppTheme.primaryCoffee,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernMenuSection extends StatelessWidget {
  const _ModernMenuSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 16, color: AppTheme.primaryCoffee),
              const SizedBox(width: 16),
              Text(
                'Menú',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppTheme.primaryCoffee,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.star, size: 16, color: AppTheme.primaryCoffee),
            ],
          ),
          const SizedBox(height: 60),
          const _ModernMenuCategory(
            title: 'Clásicos',
            price: '\$11.900',
            items: ['Vainilla', 'Naranja', 'Cocoa'],
          ),
          const SizedBox(height: 40),
          const _ModernMenuCategory(
            title: 'Gourmet',
            price: 'desde \$18.900',
            items: [
              'Chocolate intenso',
              'Mezcla de granos (maní, almendra, etc.)',
              'Clásico con trozos de chocolate semiamargo',
            ],
          ),
          const SizedBox(height: 40),
          const _ModernDegustationSet(),
        ],
      ),
    );
  }
}

class _ModernMenuCategory extends StatelessWidget {
  final String title;
  final String price;
  final List<String> items;

  const _ModernMenuCategory({
    required this.title,
    required this.price,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.7),
            offset: const Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: AppTheme.primaryCoffee.withValues(alpha: 0.1),
            offset: const Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Icons.star, size: 16, color: AppTheme.primaryCoffee),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryCoffee,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 1,
                  color: AppTheme.primaryCoffee.withValues(alpha: 0.3),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryCoffee,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 28.0),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryCoffee.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppTheme.primaryCoffee,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernDegustationSet extends StatelessWidget {
  const _ModernDegustationSet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.7),
            offset: const Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: AppTheme.primaryCoffee.withValues(alpha: 0.1),
            offset: const Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 16, color: AppTheme.primaryCoffee),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Set de degustación',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryCoffee,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '2 x \$9.900',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryCoffee,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Text(
              'Incluye 2 bandejas de degustación con 3 sabores diferentes c/u:',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.primaryCoffee,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...[
            'vainilla con mezcla de granos',
            'naranja',
            'cocoa con chocolate semiamargo',
          ].map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 44.0),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryCoffee.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppTheme.primaryCoffee,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'Ideal para conocer nuestros sabores.',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: AppTheme.primaryCoffee,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernReservationSection extends ConsumerWidget {
  const _ModernReservationSection();

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
    final availabilityAsync = ref.watch(currentAvailabilityProvider);
    final reservationsAsync = ref.watch(currentWeekReservationsProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.7),
            offset: const Offset(-8, -8),
            blurRadius: 16,
          ),
          BoxShadow(
            color: AppTheme.primaryCoffee.withValues(alpha: 0.1),
            offset: const Offset(8, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: const Column(
              children: [
                Text(
                  'DISPONIBILIDAD',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 4,
                    color: AppTheme.primaryCoffee,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'ENTREGAS FIN DE SEMANA',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: AppTheme.primaryCoffee,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: availabilityAsync.when(
              data: (availability) {
                if (availability == null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryCoffee.withValues(
                                alpha: 0.05,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.lock_outline,
                              size: 40,
                              color: AppTheme.primaryCoffee,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Agenda cerrada',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppTheme.primaryCoffee,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Estamos preparando la próxima tanda de delicias.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.primaryCoffee,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return reservationsAsync.when(
                  data: (reservations) {
                    final saturdayReservations = reservations
                        .where(
                          (r) => r.deliveryDate.weekday == DateTime.saturday,
                        )
                        .toList();
                    final sundayReservations = reservations
                        .where((r) => r.deliveryDate.weekday == DateTime.sunday)
                        .toList();

                    return Column(
                      children: [
                        _DayAvailability(
                          dayTitle: 'SÁBADO',
                          reservedCount: availability.saturdayReserved,
                          totalCount: availability.saturdayCapacity,
                          reservations: saturdayReservations,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Divider(
                            color: Color(0xFFDCD5CE),
                            thickness: 1,
                          ),
                        ),
                        _DayAvailability(
                          dayTitle: 'DOMINGO',
                          reservedCount: availability.sundayReserved,
                          totalCount: availability.sundayCapacity,
                          reservations: sundayReservations,
                        ),
                      ],
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => const Text('Error al cargar reservas'),
                );
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryCoffee,
                  ),
                ),
              ),
              error: (err, stack) => const Center(
                child: Text('No pudimos cargar la disponibilidad.'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: ElevatedButton(
              onPressed: availabilityAsync.valueOrNull == null
                  ? null
                  : _openWhatsApp,
              style:
                  ElevatedButton.styleFrom(
                    backgroundColor: availabilityAsync.valueOrNull == null
                        ? Colors.grey.withValues(alpha: 0.1)
                        : _bgColor,
                    disabledBackgroundColor: Colors.grey.withValues(
                      alpha: 0.05,
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ).copyWith(
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                  ),
              child: Opacity(
                opacity: availabilityAsync.valueOrNull == null ? 0.3 : 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: availabilityAsync.valueOrNull == null
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.8),
                              offset: const Offset(-4, -4),
                              blurRadius: 8,
                            ),
                            BoxShadow(
                              color: AppTheme.primaryCoffee.withValues(
                                alpha: 0.15,
                              ),
                              offset: const Offset(4, 4),
                              blurRadius: 8,
                            ),
                          ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        availabilityAsync.valueOrNull == null
                            ? Icons.event_busy
                            : Icons.chat_bubble_outline,
                        size: 24,
                        color: AppTheme.primaryCoffee,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        availabilityAsync.valueOrNull == null
                            ? 'Agenda no disponible'
                            : 'Apartar por WhatsApp',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          color: AppTheme.primaryCoffee,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DayAvailability extends StatelessWidget {
  final String dayTitle;
  final int reservedCount;
  final int totalCount;
  final List<Reservation> reservations;

  const _DayAvailability({
    required this.dayTitle,
    required this.reservedCount,
    required this.totalCount,
    required this.reservations,
  });

  @override
  Widget build(BuildContext context) {
    final available = totalCount - reservedCount;
    final isSoldOut = available <= 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dayTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: AppTheme.primaryCoffee,
                letterSpacing: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSoldOut
                      ? Colors.red.withValues(alpha: 0.3)
                      : const Color(0xFF1DA851).withValues(alpha: 0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.7),
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
              child: Text(
                isSoldOut ? 'AGOTADO' : '$available DISPONIBLES',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isSoldOut ? Colors.red : const Color(0xFF1DA851),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(totalCount, (index) {
            final isReserved = index < reservedCount;
            return _buildCakeSlot(isReserved);
          }),
        ),
        if (reservations.isNotEmpty) ...[
          const SizedBox(height: 24),
          const Text(
            'RESERVAS CONFIRMADAS',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryCoffee,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 12),
          ...reservations.map((res) {
            final flavors = res.items.map((i) => i.productName).join(', ');
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 12,
                    color: Color(0xFF1DA851),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${_maskName(res.customerName)} ($flavors)',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryCoffee,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ],
    );
  }

  String _maskName(String name) {
    if (name.length <= 2) return name;
    return '${name.substring(0, 2)}${'*' * (name.length - 2)}';
  }

  Widget _buildCakeSlot(bool isReserved) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: isReserved
            ? [
                BoxShadow(
                  color: AppTheme.primaryCoffee.withValues(alpha: 0.2),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                  spreadRadius: -1,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.8),
                  offset: const Offset(-2, -2),
                  blurRadius: 4,
                ),
                BoxShadow(
                  color: AppTheme.primaryCoffee.withValues(alpha: 0.1),
                  offset: const Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
      ),
      child: Center(
        child: Icon(
          Icons.cake,
          size: 16,
          color: isReserved ? AppTheme.primaryCoffee : const Color(0xFFC4BDB5),
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 40.0),
      child: Center(
        child: Text(
          '© 2026 NO PREGUNTES',
          style: TextStyle(
            color: AppTheme.primaryCoffee,
            fontSize: 10,
            letterSpacing: 3,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
