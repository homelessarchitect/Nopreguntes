import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/domain/models/product.dart';
import 'package:shared/domain/repositories/repositories.dart';

class FirebaseProductRepository implements ProductRepository {
  final FirebaseFirestore _firestore;

  FirebaseProductRepository(this._firestore);

  @override
  Future<List<ProductCategory>> getCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    return snapshot.docs
        .map((doc) => ProductCategory.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final snapshot = await _firestore
        .collection('products')
        .where('categoryId', isEqualTo: categoryId)
        .where('isActive', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => Product.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<void> saveCategory(ProductCategory category) async {
    final data = category.toJson();
    data.remove('id');
    await _firestore
        .collection('categories')
        .doc(category.id)
        .set(data, SetOptions(merge: true));
  }

  @override
  Future<void> saveProduct(Product product) async {
    final data = product.toJson();
    data.remove('id');
    await _firestore
        .collection('products')
        .doc(product.id)
        .set(data, SetOptions(merge: true));
  }

  @override
  Future<void> deleteCategory(String categoryId) async {
    await _firestore.collection('categories').doc(categoryId).delete();
  }

  @override
  Future<void> deleteProduct(String productId) async {
    await _firestore.collection('products').doc(productId).delete();
  }
}
