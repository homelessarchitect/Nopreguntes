import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/providers.dart';
import 'package:admin_app/features/dashboard/dashboard_view_model.dart';

part 'inventory_view_model.g.dart';

@riverpod
Future<List<Reservation>> weeklyReservations(
  Ref ref,
  String availabilityId,
) async {
  final repo = ref.watch(reservationRepositoryProvider);
  return repo.getReservations(availabilityId);
}

@riverpod
class InventoryViewModel extends _$InventoryViewModel {
  @override
  bool build() {
    return false; // isLoading state
  }

  Future<void> publishAvailability(WeeklyAvailability availability) async {
    state = true;
    try {
      final repo = ref.read(reservationRepositoryProvider);
      await repo.saveAvailability(availability);
      ref.invalidate(adminAvailabilityProvider);
    } finally {
      state = false;
    }
  }

  Future<void> createReservation(Reservation reservation) async {
    state = true;
    try {
      final repo = ref.read(reservationRepositoryProvider);
      await repo.createReservation(reservation);
      ref.invalidate(weeklyReservationsProvider(reservation.availabilityId));
      ref.invalidate(adminAvailabilityProvider);
    } finally {
      state = false;
    }
  }
}
