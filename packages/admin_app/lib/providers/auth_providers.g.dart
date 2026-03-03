// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminAuthRepositoryHash() =>
    r'a65fd440c27dcbfff609ebe5521772b0d89d7f22';

/// See also [adminAuthRepository].
@ProviderFor(adminAuthRepository)
final adminAuthRepositoryProvider = Provider<AuthRepository>.internal(
  adminAuthRepository,
  name: r'adminAuthRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminAuthRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminAuthRepositoryRef = ProviderRef<AuthRepository>;
String _$adminAuthStateHash() => r'ddc5a70c8db939c837f95e59eee2cab973c89005';

/// See also [adminAuthState].
@ProviderFor(adminAuthState)
final adminAuthStateProvider = StreamProvider<AppUser?>.internal(
  adminAuthState,
  name: r'adminAuthStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminAuthStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminAuthStateRef = StreamProviderRef<AppUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
