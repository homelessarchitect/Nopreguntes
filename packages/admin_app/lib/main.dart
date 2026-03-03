import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_app/firebase_options.dart';
import 'package:admin_app/features/dashboard/dashboard_screen.dart';
import 'package:admin_app/features/auth/login_screen.dart';
import 'package:shared/presentation/theme.dart';
import 'package:admin_app/providers/auth_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: AdminApp()));
}

class AdminApp extends ConsumerWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(adminAuthStateProvider);

    return MaterialApp(
      title: 'No Preguntes Admin',
      theme: AppTheme.lightTheme,
      home: authStateAsync.when(
        data: (user) {
          if (user == null || user.role != 'admin') {
            return const LoginScreen();
          }
          return const DashboardScreen();
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (e, s) =>
            Scaffold(body: Center(child: Text('Error de autenticación: $e'))),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
