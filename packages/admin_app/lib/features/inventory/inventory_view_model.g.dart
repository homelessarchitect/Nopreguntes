// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weeklyReservationsHash() =>
    r'2ee7a371985fbf2c90229b74ead063d92f73e113';

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

/// See also [weeklyReservations].
@ProviderFor(weeklyReservations)
const weeklyReservationsProvider = WeeklyReservationsFamily();

/// See also [weeklyReservations].
class WeeklyReservationsFamily extends Family<AsyncValue<List<Reservation>>> {
  /// See also [weeklyReservations].
  const WeeklyReservationsFamily();

  /// See also [weeklyReservations].
  WeeklyReservationsProvider call(String availabilityId) {
    return WeeklyReservationsProvider(availabilityId);
  }

  @override
  WeeklyReservationsProvider getProviderOverride(
    covariant WeeklyReservationsProvider provider,
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
  String? get name => r'weeklyReservationsProvider';
}

/// See also [weeklyReservations].
class WeeklyReservationsProvider
    extends AutoDisposeFutureProvider<List<Reservation>> {
  /// See also [weeklyReservations].
  WeeklyReservationsProvider(String availabilityId)
    : this._internal(
        (ref) =>
            weeklyReservations(ref as WeeklyReservationsRef, availabilityId),
        from: weeklyReservationsProvider,
        name: r'weeklyReservationsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weeklyReservationsHash,
        dependencies: WeeklyReservationsFamily._dependencies,
        allTransitiveDependencies:
            WeeklyReservationsFamily._allTransitiveDependencies,
        availabilityId: availabilityId,
      );

  WeeklyReservationsProvider._internal(
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
    FutureOr<List<Reservation>> Function(WeeklyReservationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeeklyReservationsProvider._internal(
        (ref) => create(ref as WeeklyReservationsRef),
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
    return _WeeklyReservationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeeklyReservationsProvider &&
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
mixin WeeklyReservationsRef on AutoDisposeFutureProviderRef<List<Reservation>> {
  /// The parameter `availabilityId` of this provider.
  String get availabilityId;
}

class _WeeklyReservationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Reservation>>
    with WeeklyReservationsRef {
  _WeeklyReservationsProviderElement(super.provider);

  @override
  String get availabilityId =>
      (origin as WeeklyReservationsProvider).availabilityId;
}

String _$inventoryViewModelHash() =>
    r'2ac2d829ff03d586087a09718cd3f5f78c31f39c';

/// See also [InventoryViewModel].
@ProviderFor(InventoryViewModel)
final inventoryViewModelProvider =
    AutoDisposeNotifierProvider<InventoryViewModel, bool>.internal(
      InventoryViewModel.new,
      name: r'inventoryViewModelProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$inventoryViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$InventoryViewModel = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
