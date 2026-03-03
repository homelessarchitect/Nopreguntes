// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyAvailabilityImpl _$$WeeklyAvailabilityImplFromJson(
  Map<String, dynamic> json,
) => _$WeeklyAvailabilityImpl(
  id: json['id'] as String,
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  saturdayCapacity: (json['saturdayCapacity'] as num).toInt(),
  sundayCapacity: (json['sundayCapacity'] as num).toInt(),
  saturdayReserved: (json['saturdayReserved'] as num?)?.toInt() ?? 0,
  sundayReserved: (json['sundayReserved'] as num?)?.toInt() ?? 0,
  isPublished: json['isPublished'] as bool? ?? true,
);

Map<String, dynamic> _$$WeeklyAvailabilityImplToJson(
  _$WeeklyAvailabilityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'saturdayCapacity': instance.saturdayCapacity,
  'sundayCapacity': instance.sundayCapacity,
  'saturdayReserved': instance.saturdayReserved,
  'sundayReserved': instance.sundayReserved,
  'isPublished': instance.isPublished,
};

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      id: json['id'] as String,
      availabilityId: json['availabilityId'] as String,
      customerId: json['customerId'] as String?,
      customerName: json['customerName'] as String,
      customerPhone: json['customerPhone'] as String,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
      items: (json['items'] as List<dynamic>)
          .map((e) => ReservationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'availabilityId': instance.availabilityId,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerPhone': instance.customerPhone,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
      'items': instance.items,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'status': instance.status,
    };

_$ReservationItemImpl _$$ReservationItemImplFromJson(
  Map<String, dynamic> json,
) => _$ReservationItemImpl(
  productId: json['productId'] as String,
  productName: json['productName'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unitPrice'] as num).toInt(),
);

Map<String, dynamic> _$$ReservationItemImplToJson(
  _$ReservationItemImpl instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'productName': instance.productName,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
};
