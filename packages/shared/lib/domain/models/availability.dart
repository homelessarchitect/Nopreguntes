import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability.freezed.dart';
part 'availability.g.dart';

@freezed
class WeeklyAvailability with _$WeeklyAvailability {
  const factory WeeklyAvailability({
    required String id,
    required DateTime startDate,
    required DateTime endDate,
    required int saturdayCapacity,
    required int sundayCapacity,
    @Default(0) int saturdayReserved,
    @Default(0) int sundayReserved,
    @Default(true) bool isPublished,
  }) = _WeeklyAvailability;

  factory WeeklyAvailability.fromJson(Map<String, dynamic> json) =>
      _$WeeklyAvailabilityFromJson(json);
}

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required String availabilityId,
    String? customerId,
    required String customerName,
    required String customerPhone,
    String? deliveryAddress,
    required DateTime deliveryDate,
    required List<ReservationItem> items,
    required int totalPrice,
    DateTime? createdAt,
    @Default('pending') String status,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

@freezed
class ReservationItem with _$ReservationItem {
  const factory ReservationItem({
    required String productId,
    required String productName,
    required int quantity,
    required int unitPrice,
  }) = _ReservationItem;

  factory ReservationItem.fromJson(Map<String, dynamic> json) =>
      _$ReservationItemFromJson(json);
}
