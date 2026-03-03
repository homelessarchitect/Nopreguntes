import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared/domain/models/availability.dart';
import 'package:shared/domain/repositories/repositories.dart';

class FirebaseReservationRepository implements ReservationRepository {
  final FirebaseFirestore _firestore;

  FirebaseReservationRepository(this._firestore);

  @override
  Future<WeeklyAvailability?> getCurrentAvailability() async {
    final snapshot = await _firestore
        .collection('availability')
        .where('isPublished', isEqualTo: true)
        .orderBy('startDate', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return WeeklyAvailability.fromJson({
      ...snapshot.docs.first.data(),
      'id': snapshot.docs.first.id,
    });
  }

  @override
  Future<void> saveAvailability(WeeklyAvailability availability) async {
    final data = availability.toJson();
    data.remove('id');
    await _firestore
        .collection('availability')
        .doc(availability.id)
        .set(data, SetOptions(merge: true));
  }

  @override
  Future<List<Reservation>> getReservations(String availabilityId) async {
    final snapshot = await _firestore
        .collection('reservations')
        .where('availabilityId', isEqualTo: availabilityId)
        .get();
    return snapshot.docs
        .map((doc) => Reservation.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }

  @override
  Future<void> createReservation(Reservation reservation) async {
    final docRef = _firestore.collection('reservations').doc(reservation.id);
    await _firestore.runTransaction((transaction) async {
      // Get current availability to check capacity
      final availRef = _firestore
          .collection('availability')
          .doc(reservation.availabilityId);
      final availSnapshot = await transaction.get(availRef);
      if (!availSnapshot.exists) throw Exception('Availability not found');

      final availability = WeeklyAvailability.fromJson({
        ...availSnapshot.data()!,
        'id': availSnapshot.id,
      });

      int sabadoCap = availability.saturdayCapacity;
      int domingoCap = availability.sundayCapacity;
      int sabadoRes = availability.saturdayReserved;
      int domingoRes = availability.sundayReserved;

      int totalItemsReserved = reservation.items.fold(
        0,
        (suma, item) => suma + item.quantity,
      );

      if (reservation.deliveryDate.weekday == DateTime.saturday) {
        if (sabadoRes + totalItemsReserved > sabadoCap) {
          throw Exception('No hay suficiente capacidad para el sábado');
        }
        transaction.update(availRef, {
          'saturdayReserved': sabadoRes + totalItemsReserved,
        });
      } else if (reservation.deliveryDate.weekday == DateTime.sunday) {
        if (domingoRes + totalItemsReserved > domingoCap) {
          throw Exception('No hay suficiente capacidad para el domingo');
        }
        transaction.update(availRef, {
          'sundayReserved': domingoRes + totalItemsReserved,
        });
      } else {
        throw Exception('Día de entrega no válido, debe ser sábado o domingo');
      }

      final resData = reservation.toJson();
      resData['createdAt'] = FieldValue.serverTimestamp();
      transaction.set(docRef, resData);
    });
  }

  @override
  Future<void> updateReservationStatus(
    String reservationId,
    String status,
  ) async {
    await _firestore.collection('reservations').doc(reservationId).update({
      'status': status,
    });
  }

  @override
  Future<List<Reservation>> getReservationsByCustomerInfo(String info) async {
    // Try searching by phone first
    final phoneSnapshot = await _firestore
        .collection('reservations')
        .where('customerPhone', isEqualTo: info)
        .get();

    if (phoneSnapshot.docs.isNotEmpty) {
      return phoneSnapshot.docs
          .map((doc) => Reservation.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    }

    // Try searching by name (fallback if phone doesn't match)
    final nameSnapshot = await _firestore
        .collection('reservations')
        .where('customerName', isEqualTo: info)
        .get();

    return nameSnapshot.docs
        .map((doc) => Reservation.fromJson({...doc.data(), 'id': doc.id}))
        .toList();
  }
}
