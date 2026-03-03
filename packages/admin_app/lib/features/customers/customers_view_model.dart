import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/customer.dart';
import 'package:shared/providers.dart';

part 'customers_view_model.g.dart';

@riverpod
Stream<List<Customer>> customers(Ref ref) {
  return ref.watch(customerRepositoryProvider).getCustomers();
}

@riverpod
class CustomersViewModel extends _$CustomersViewModel {
  @override
  FutureOr<void> build() async {}

  Future<void> createCustomer(Customer customer) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(customerRepositoryProvider).createCustomer(customer),
    );
  }

  Future<void> updateCustomer(Customer customer) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(customerRepositoryProvider).updateCustomer(customer),
    );
  }

  Future<void> deleteCustomer(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(customerRepositoryProvider).deleteCustomer(id),
    );
  }
}
