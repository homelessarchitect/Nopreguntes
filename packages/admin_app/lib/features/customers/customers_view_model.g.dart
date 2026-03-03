// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$customersHash() => r'1e70030140c42471d75cd41d12f39146cecb848f';

/// See also [customers].
@ProviderFor(customers)
final customersProvider = AutoDisposeStreamProvider<List<Customer>>.internal(
  customers,
  name: r'customersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CustomersRef = AutoDisposeStreamProviderRef<List<Customer>>;
String _$customersViewModelHash() =>
    r'4e0eacb90285bd494d8f749469365c90a20ac049';

/// See also [CustomersViewModel].
@ProviderFor(CustomersViewModel)
final customersViewModelProvider =
    AutoDisposeAsyncNotifierProvider<CustomersViewModel, void>.internal(
      CustomersViewModel.new,
      name: r'customersViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$customersViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CustomersViewModel = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
