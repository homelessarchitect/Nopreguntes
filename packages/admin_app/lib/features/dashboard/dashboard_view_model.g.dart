// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminAvailabilityHash() => r'6c4c6e3af1084566e0e3239ab3f5d2eb869bc8e2';

/// See also [adminAvailability].
@ProviderFor(adminAvailability)
final adminAvailabilityProvider =
    AutoDisposeFutureProvider<WeeklyAvailability?>.internal(
      adminAvailability,
      name: r'adminAvailabilityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminAvailabilityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AdminAvailabilityRef =
    AutoDisposeFutureProviderRef<WeeklyAvailability?>;
String _$reservationsHash() => r'f6daf3006d3f02bdde8ae0bc1e31821a07f570e7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [reservations].
@ProviderFor(reservations)
const reservationsProvider = ReservationsFamily();

/// See also [reservations].
class ReservationsFamily extends Family<AsyncValue<List<Reservation>>> {
  /// See also [reservations].
  const ReservationsFamily();

  /// See also [reservations].
  ReservationsProvider call(String availabilityId) {
    return ReservationsProvider(availabilityId);
  }

  @override
  ReservationsProvider getProviderOverride(
    covariant ReservationsProvider provider,
  ) {
    return call(provider.availabilityId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'reservationsProvider';
}

/// See also [reservations].
class ReservationsProvider
    extends AutoDisposeFutureProvider<List<Reservation>> {
  /// See also [reservations].
  ReservationsProvider(String availabilityId)
    : this._internal(
        (ref) => reservations(ref as ReservationsRef, availabilityId),
        from: reservationsProvider,
        name: r'reservationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$reservationsHash,
        dependencies: ReservationsFamily._dependencies,
        allTransitiveDependencies:
            ReservationsFamily._allTransitiveDependencies,
        availabilityId: availabilityId,
      );

  ReservationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.availabilityId,
  }) : super.internal();

  final String availabilityId;

  @override
  Override overrideWith(
    FutureOr<List<Reservation>> Function(ReservationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReservationsProvider._internal(
        (ref) => create(ref as ReservationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        availabilityId: availabilityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Reservation>> createElement() {
    return _ReservationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReservationsProvider &&
        other.availabilityId == availabilityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, availabilityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReservationsRef on AutoDisposeFutureProviderRef<List<Reservation>> {
  /// The parameter `availabilityId` of this provider.
  String get availabilityId;
}

class _ReservationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Reservation>>
    with ReservationsRef {
  _ReservationsProviderElement(super.provider);

  @override
  String get availabilityId => (origin as ReservationsProvider).availabilityId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
