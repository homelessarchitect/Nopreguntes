import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/presentation/theme.dart';
import 'package:admin_app/providers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE6E1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAE6E1),
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
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  letterSpacing: 2,
                  color: AppTheme.primaryCoffee,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'ADMIN PANEL',
                style: TextStyle(
                  letterSpacing: 6,
                  color: AppTheme.primaryCoffee,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 64),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await ref
                        .read(adminAuthRepositoryProvider)
                        .signInWithGoogle();
                  } catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryCoffee,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: const Icon(Icons.login),
                label: const Text(
                  'Iniciar sesión con Google',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
