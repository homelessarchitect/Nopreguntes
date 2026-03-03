import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/domain/models/product.dart';
import 'package:shared/providers.dart';

part 'home_view_model.g.dart';

@riverpod
Future<List<ProductCategory>> categories(Ref ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getCategories();
}

@riverpod
Future<WeeklyAvailability?> currentAvailability(Ref ref) async {
  final repo = ref.watch(reservationRepositoryProvider);
  return repo.getCurrentAvailability();
}

@riverpod
Future<List<Reservation>> currentWeekReservations(Ref ref) async {
  final availability = await ref.watch(currentAvailabilityProvider.future);
  if (availability == null) return [];
  final repo = ref.watch(reservationRepositoryProvider);
  return repo.getReservations(availability.id);
}
