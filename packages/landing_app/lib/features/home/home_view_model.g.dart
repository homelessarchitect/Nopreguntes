// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesHash() => r'ec640f51d969a6282cc0280bdd7ca797d8f70616';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider =
    AutoDisposeFutureProvider<List<ProductCategory>>.internal(
      categories,
      name: r'categoriesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$categoriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<List<ProductCategory>>;
String _$currentAvailabilityHash() =>
    r'5dab467082fd5b10a64d716fc39b3e14c4a69014';

/// See also [currentAvailability].
@ProviderFor(currentAvailability)
final currentAvailabilityProvider =
    AutoDisposeFutureProvider<WeeklyAvailability?>.internal(
      currentAvailability,
      name: r'currentAvailabilityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentAvailabilityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentAvailabilityRef =
    AutoDisposeFutureProviderRef<WeeklyAvailability?>;
String _$currentWeekReservationsHash() =>
    r'3bbe15e54d80209cdaf54d9cde5faecffaca8d91';

/// See also [currentWeekReservations].
@ProviderFor(currentWeekReservations)
final currentWeekReservationsProvider =
    AutoDisposeFutureProvider<List<Reservation>>.internal(
      currentWeekReservations,
      name: r'currentWeekReservationsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentWeekReservationsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentWeekReservationsRef =
    AutoDisposeFutureProviderRef<List<Reservation>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
