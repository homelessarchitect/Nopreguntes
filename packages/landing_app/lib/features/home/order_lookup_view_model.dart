import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/providers.dart';

part 'order_lookup_view_model.g.dart';

@riverpod
class OrderLookupViewModel extends _$OrderLookupViewModel {
  @override
  AsyncValue<List<Reservation>?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> search(String info) async {
    if (info.isEmpty) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(reservationRepositoryProvider);
      return repo.getReservationsByCustomerInfo(info);
    });
  }
}
