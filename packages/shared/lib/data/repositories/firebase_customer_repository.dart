import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/domain/models/customer.dart';
import 'package:shared/domain/repositories/repositories.dart';

class FirebaseCustomerRepository implements CustomerRepository {
  final FirebaseFirestore _firestore;
  static const String _collectionPath = 'customers';

  FirebaseCustomerRepository(this._firestore);

  @override
  Stream<List<Customer>> getCustomers() {
    return _firestore
        .collection(_collectionPath)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Customer.fromJson({...doc.data(), 'id': doc.id}))
              .toList(),
        );
  }

  @override
  Future<void> createCustomer(Customer customer) async {
    await _firestore.collection(_collectionPath).add({
      ...customer.toJson(),
      'createdAt': customer.createdAt ?? FieldValue.serverTimestamp(),
    });
  }

  @override
  Future<void> updateCustomer(Customer customer) async {
    await _firestore
        .collection(_collectionPath)
        .doc(customer.id)
        .update(customer.toJson());
  }

  @override
  Future<void> deleteCustomer(String id) async {
    await _firestore.collection(_collectionPath).doc(id).delete();
  }

  @override
  Future<Customer?> getCustomerById(String id) async {
    final doc = await _firestore.collection(_collectionPath).doc(id).get();
    if (doc.exists) {
      return Customer.fromJson({...doc.data()!, 'id': doc.id});
    }
    return null;
  }
}
