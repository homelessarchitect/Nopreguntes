import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/providers.dart';
import 'package:uuid/uuid.dart';

part 'reservation_view_model.g.dart';

@riverpod
class ReservationViewModel extends _$ReservationViewModel {
  @override
  bool build() {
    return false; // represents isLoading
  }

  Future<void> submitReservation({
    required String availabilityId,
    required String name,
    required String phone,
    required String address,
    required DateTime deliveryDate,
    required List<ReservationItem> items,
    required int totalPrice,
  }) async {
    state = true;
    try {
      final repo = ref.read(reservationRepositoryProvider);
      final reservation = Reservation(
        id: const Uuid().v4(),
        availabilityId: availabilityId,
        customerName: name,
        customerPhone: phone,
        deliveryAddress: address,
        deliveryDate: deliveryDate,
        items: items,
        totalPrice: totalPrice,
        createdAt: DateTime.now(),
      );

      await repo.createReservation(reservation);
    } finally {
      state = false;
    }
  }
}
