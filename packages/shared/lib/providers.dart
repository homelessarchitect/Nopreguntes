import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/data/repositories/firebase_product_repository.dart';
import 'package:shared/data/repositories/firebase_reservation_repository.dart';
import 'package:shared/data/repositories/firebase_customer_repository.dart';
import 'package:shared/domain/repositories/repositories.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
CustomerRepository customerRepository(Ref ref) {
  return FirebaseCustomerRepository(ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
ProductRepository productRepository(Ref ref) {
  return FirebaseProductRepository(ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
ReservationRepository reservationRepository(Ref ref) {
  return FirebaseReservationRepository(ref.watch(firestoreProvider));
}
