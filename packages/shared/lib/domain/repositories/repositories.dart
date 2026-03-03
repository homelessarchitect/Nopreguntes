import 'package:shared/domain/models/availability.dart';
import 'package:shared/domain/models/product.dart';
import 'package:shared/domain/models/app_user.dart';
import 'package:shared/domain/models/customer.dart';

abstract class AuthRepository {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser?> signInWithGoogle();
  Future<void> signOut();
}

abstract class CustomerRepository {
  Stream<List<Customer>> getCustomers();
  Future<void> createCustomer(Customer customer);
  Future<void> updateCustomer(Customer customer);
  Future<void> deleteCustomer(String id);
  Future<Customer?> getCustomerById(String id);
}

abstract class ProductRepository {
  Future<List<ProductCategory>> getCategories();
  Future<List<Product>> getProductsByCategory(String categoryId);
  Future<void> saveCategory(ProductCategory category);
  Future<void> saveProduct(Product product);
  Future<void> deleteCategory(String categoryId);
  Future<void> deleteProduct(String productId);
}

abstract class ReservationRepository {
  Future<WeeklyAvailability?> getCurrentAvailability();
  Future<void> saveAvailability(WeeklyAvailability availability);

  Future<List<Reservation>> getReservations(String availabilityId);
  Future<void> createReservation(Reservation reservation);
  Future<void> updateReservationStatus(String reservationId, String status);
  Future<List<Reservation>> getReservationsByCustomerInfo(String info);
}
