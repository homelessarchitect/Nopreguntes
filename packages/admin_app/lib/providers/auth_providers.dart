import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:admin_app/data/repositories/firebase_auth_repository.dart';
import 'package:shared/domain/repositories/repositories.dart';
import 'package:shared/domain/models/app_user.dart';
import 'package:shared/providers.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
AuthRepository adminAuthRepository(Ref ref) {
  return FirebaseAuthRepository(firestore: ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
Stream<AppUser?> adminAuthState(Ref ref) {
  return ref.watch(adminAuthRepositoryProvider).authStateChanges;
}
