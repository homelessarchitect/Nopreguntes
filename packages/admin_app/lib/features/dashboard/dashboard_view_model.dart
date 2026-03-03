import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/providers.dart';

part 'dashboard_view_model.g.dart';

@riverpod
Future<WeeklyAvailability?> adminAvailability(Ref ref) async {
  final repo = ref.watch(reservationRepositoryProvider);
  return repo.getCurrentAvailability();
}

@riverpod
Future<List<Reservation>> reservations(Ref ref, String availabilityId) async {
  final repo = ref.watch(reservationRepositoryProvider);
  return repo.getReservations(availabilityId);
}
