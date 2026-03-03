// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'availability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeeklyAvailability _$WeeklyAvailabilityFromJson(Map<String, dynamic> json) {
  return _WeeklyAvailability.fromJson(json);
}

/// @nodoc
mixin _$WeeklyAvailability {
  String get id => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  int get saturdayCapacity => throw _privateConstructorUsedError;
  int get sundayCapacity => throw _privateConstructorUsedError;
  int get saturdayReserved => throw _privateConstructorUsedError;
  int get sundayReserved => throw _privateConstructorUsedError;
  bool get isPublished => throw _privateConstructorUsedError;

  /// Serializes this WeeklyAvailability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyAvailabilityCopyWith<WeeklyAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyAvailabilityCopyWith<$Res> {
  factory $WeeklyAvailabilityCopyWith(
    WeeklyAvailability value,
    $Res Function(WeeklyAvailability) then,
  ) = _$WeeklyAvailabilityCopyWithImpl<$Res, WeeklyAvailability>;
  @useResult
  $Res call({
    String id,
    DateTime startDate,
    DateTime endDate,
    int saturdayCapacity,
    int sundayCapacity,
    int saturdayReserved,
    int sundayReserved,
    bool isPublished,
  });
}

/// @nodoc
class _$WeeklyAvailabilityCopyWithImpl<$Res, $Val extends WeeklyAvailability>
    implements $WeeklyAvailabilityCopyWith<$Res> {
  _$WeeklyAvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? saturdayCapacity = null,
    Object? sundayCapacity = null,
    Object? saturdayReserved = null,
    Object? sundayReserved = null,
    Object? isPublished = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            saturdayCapacity: null == saturdayCapacity
                ? _value.saturdayCapacity
                : saturdayCapacity // ignore: cast_nullable_to_non_nullable
                      as int,
            sundayCapacity: null == sundayCapacity
                ? _value.sundayCapacity
                : sundayCapacity // ignore: cast_nullable_to_non_nullable
                      as int,
            saturdayReserved: null == saturdayReserved
                ? _value.saturdayReserved
                : saturdayReserved // ignore: cast_nullable_to_non_nullable
                      as int,
            sundayReserved: null == sundayReserved
                ? _value.sundayReserved
                : sundayReserved // ignore: cast_nullable_to_non_nullable
                      as int,
            isPublished: null == isPublished
                ? _value.isPublished
                : isPublished // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyAvailabilityImplCopyWith<$Res>
    implements $WeeklyAvailabilityCopyWith<$Res> {
  factory _$$WeeklyAvailabilityImplCopyWith(
    _$WeeklyAvailabilityImpl value,
    $Res Function(_$WeeklyAvailabilityImpl) then,
  ) = __$$WeeklyAvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime startDate,
    DateTime endDate,
    int saturdayCapacity,
    int sundayCapacity,
    int saturdayReserved,
    int sundayReserved,
    bool isPublished,
  });
}

/// @nodoc
class __$$WeeklyAvailabilityImplCopyWithImpl<$Res>
    extends _$WeeklyAvailabilityCopyWithImpl<$Res, _$WeeklyAvailabilityImpl>
    implements _$$WeeklyAvailabilityImplCopyWith<$Res> {
  __$$WeeklyAvailabilityImplCopyWithImpl(
    _$WeeklyAvailabilityImpl _value,
    $Res Function(_$WeeklyAvailabilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? saturdayCapacity = null,
    Object? sundayCapacity = null,
    Object? saturdayReserved = null,
    Object? sundayReserved = null,
    Object? isPublished = null,
  }) {
    return _then(
      _$WeeklyAvailabilityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        saturdayCapacity: null == saturdayCapacity
            ? _value.saturdayCapacity
            : saturdayCapacity // ignore: cast_nullable_to_non_nullable
                  as int,
        sundayCapacity: null == sundayCapacity
            ? _value.sundayCapacity
            : sundayCapacity // ignore: cast_nullable_to_non_nullable
                  as int,
        saturdayReserved: null == saturdayReserved
            ? _value.saturdayReserved
            : saturdayReserved // ignore: cast_nullable_to_non_nullable
                  as int,
        sundayReserved: null == sundayReserved
            ? _value.sundayReserved
            : sundayReserved // ignore: cast_nullable_to_non_nullable
                  as int,
        isPublished: null == isPublished
            ? _value.isPublished
            : isPublished // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyAvailabilityImpl implements _WeeklyAvailability {
  const _$WeeklyAvailabilityImpl({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.saturdayCapacity,
    required this.sundayCapacity,
    this.saturdayReserved = 0,
    this.sundayReserved = 0,
    this.isPublished = true,
  });

  factory _$WeeklyAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyAvailabilityImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final int saturdayCapacity;
  @override
  final int sundayCapacity;
  @override
  @JsonKey()
  final int saturdayReserved;
  @override
  @JsonKey()
  final int sundayReserved;
  @override
  @JsonKey()
  final bool isPublished;

  @override
  String toString() {
    return 'WeeklyAvailability(id: $id, startDate: $startDate, endDate: $endDate, saturdayCapacity: $saturdayCapacity, sundayCapacity: $sundayCapacity, saturdayReserved: $saturdayReserved, sundayReserved: $sundayReserved, isPublished: $isPublished)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyAvailabilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.saturdayCapacity, saturdayCapacity) ||
                other.saturdayCapacity == saturdayCapacity) &&
            (identical(other.sundayCapacity, sundayCapacity) ||
                other.sundayCapacity == sundayCapacity) &&
            (identical(other.saturdayReserved, saturdayReserved) ||
                other.saturdayReserved == saturdayReserved) &&
            (identical(other.sundayReserved, sundayReserved) ||
                other.sundayReserved == sundayReserved) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    startDate,
    endDate,
    saturdayCapacity,
    sundayCapacity,
    saturdayReserved,
    sundayReserved,
    isPublished,
  );

  /// Create a copy of WeeklyAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyAvailabilityImplCopyWith<_$WeeklyAvailabilityImpl> get copyWith =>
      __$$WeeklyAvailabilityImplCopyWithImpl<_$WeeklyAvailabilityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyAvailabilityImplToJson(this);
  }
}

abstract class _WeeklyAvailability implements WeeklyAvailability {
  const factory _WeeklyAvailability({
    required final String id,
    required final DateTime startDate,
    required final DateTime endDate,
    required final int saturdayCapacity,
    required final int sundayCapacity,
    final int saturdayReserved,
    final int sundayReserved,
    final bool isPublished,
  }) = _$WeeklyAvailabilityImpl;

  factory _WeeklyAvailability.fromJson(Map<String, dynamic> json) =
      _$WeeklyAvailabilityImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  int get saturdayCapacity;
  @override
  int get sundayCapacity;
  @override
  int get saturdayReserved;
  @override
  int get sundayReserved;
  @override
  bool get isPublished;

  /// Create a copy of WeeklyAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyAvailabilityImplCopyWith<_$WeeklyAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  String get id => throw _privateConstructorUsedError;
  String get availabilityId => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get customerPhone => throw _privateConstructorUsedError;
  String? get deliveryAddress => throw _privateConstructorUsedError;
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  List<ReservationItem> get items => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
    Reservation value,
    $Res Function(Reservation) then,
  ) = _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call({
    String id,
    String availabilityId,
    String? customerId,
    String customerName,
    String customerPhone,
    String? deliveryAddress,
    DateTime deliveryDate,
    List<ReservationItem> items,
    int totalPrice,
    DateTime? createdAt,
    String status,
  });
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? availabilityId = null,
    Object? customerId = freezed,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = freezed,
    Object? deliveryDate = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? createdAt = freezed,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            availabilityId: null == availabilityId
                ? _value.availabilityId
                : availabilityId // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: freezed == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            customerPhone: null == customerPhone
                ? _value.customerPhone
                : customerPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryAddress: freezed == deliveryAddress
                ? _value.deliveryAddress
                : deliveryAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryDate: null == deliveryDate
                ? _value.deliveryDate
                : deliveryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<ReservationItem>,
            totalPrice: null == totalPrice
                ? _value.totalPrice
                : totalPrice // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReservationImplCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$ReservationImplCopyWith(
    _$ReservationImpl value,
    $Res Function(_$ReservationImpl) then,
  ) = __$$ReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String availabilityId,
    String? customerId,
    String customerName,
    String customerPhone,
    String? deliveryAddress,
    DateTime deliveryDate,
    List<ReservationItem> items,
    int totalPrice,
    DateTime? createdAt,
    String status,
  });
}

/// @nodoc
class __$$ReservationImplCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$ReservationImpl>
    implements _$$ReservationImplCopyWith<$Res> {
  __$$ReservationImplCopyWithImpl(
    _$ReservationImpl _value,
    $Res Function(_$ReservationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? availabilityId = null,
    Object? customerId = freezed,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? deliveryAddress = freezed,
    Object? deliveryDate = null,
    Object? items = null,
    Object? totalPrice = null,
    Object? createdAt = freezed,
    Object? status = null,
  }) {
    return _then(
      _$ReservationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        availabilityId: null == availabilityId
            ? _value.availabilityId
            : availabilityId // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: freezed == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        customerPhone: null == customerPhone
            ? _value.customerPhone
            : customerPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryAddress: freezed == deliveryAddress
            ? _value.deliveryAddress
            : deliveryAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryDate: null == deliveryDate
            ? _value.deliveryDate
            : deliveryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ReservationItem>,
        totalPrice: null == totalPrice
            ? _value.totalPrice
            : totalPrice // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationImpl implements _Reservation {
  const _$ReservationImpl({
    required this.id,
    required this.availabilityId,
    this.customerId,
    required this.customerName,
    required this.customerPhone,
    this.deliveryAddress,
    required this.deliveryDate,
    required final List<ReservationItem> items,
    required this.totalPrice,
    this.createdAt,
    this.status = 'pending',
  }) : _items = items;

  factory _$ReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationImplFromJson(json);

  @override
  final String id;
  @override
  final String availabilityId;
  @override
  final String? customerId;
  @override
  final String customerName;
  @override
  final String customerPhone;
  @override
  final String? deliveryAddress;
  @override
  final DateTime deliveryDate;
  final List<ReservationItem> _items;
  @override
  List<ReservationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalPrice;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'Reservation(id: $id, availabilityId: $availabilityId, customerId: $customerId, customerName: $customerName, customerPhone: $customerPhone, deliveryAddress: $deliveryAddress, deliveryDate: $deliveryDate, items: $items, totalPrice: $totalPrice, createdAt: $createdAt, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.availabilityId, availabilityId) ||
                other.availabilityId == availabilityId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    availabilityId,
    customerId,
    customerName,
    customerPhone,
    deliveryAddress,
    deliveryDate,
    const DeepCollectionEquality().hash(_items),
    totalPrice,
    createdAt,
    status,
  );

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      __$$ReservationImplCopyWithImpl<_$ReservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationImplToJson(this);
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation({
    required final String id,
    required final String availabilityId,
    final String? customerId,
    required final String customerName,
    required final String customerPhone,
    final String? deliveryAddress,
    required final DateTime deliveryDate,
    required final List<ReservationItem> items,
    required final int totalPrice,
    final DateTime? createdAt,
    final String status,
  }) = _$ReservationImpl;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$ReservationImpl.fromJson;

  @override
  String get id;
  @override
  String get availabilityId;
  @override
  String? get customerId;
  @override
  String get customerName;
  @override
  String get customerPhone;
  @override
  String? get deliveryAddress;
  @override
  DateTime get deliveryDate;
  @override
  List<ReservationItem> get items;
  @override
  int get totalPrice;
  @override
  DateTime? get createdAt;
  @override
  String get status;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReservationItem _$ReservationItemFromJson(Map<String, dynamic> json) {
  return _ReservationItem.fromJson(json);
}

/// @nodoc
mixin _$ReservationItem {
  String get productId => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this ReservationItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReservationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationItemCopyWith<ReservationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationItemCopyWith<$Res> {
  factory $ReservationItemCopyWith(
    ReservationItem value,
    $Res Function(ReservationItem) then,
  ) = _$ReservationItemCopyWithImpl<$Res, ReservationItem>;
  @useResult
  $Res call({
    String productId,
    String productName,
    int quantity,
    int unitPrice,
  });
}

/// @nodoc
class _$ReservationItemCopyWithImpl<$Res, $Val extends ReservationItem>
    implements $ReservationItemCopyWith<$Res> {
  _$ReservationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReservationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(
      _value.copyWith(
            productId: null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                      as String,
            productName: null == productName
                ? _value.productName
                : productName // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            unitPrice: null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReservationItemImplCopyWith<$Res>
    implements $ReservationItemCopyWith<$Res> {
  factory _$$ReservationItemImplCopyWith(
    _$ReservationItemImpl value,
    $Res Function(_$ReservationItemImpl) then,
  ) = __$$ReservationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String productId,
    String productName,
    int quantity,
    int unitPrice,
  });
}

/// @nodoc
class __$$ReservationItemImplCopyWithImpl<$Res>
    extends _$ReservationItemCopyWithImpl<$Res, _$ReservationItemImpl>
    implements _$$ReservationItemImplCopyWith<$Res> {
  __$$ReservationItemImplCopyWithImpl(
    _$ReservationItemImpl _value,
    $Res Function(_$ReservationItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReservationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(
      _$ReservationItemImpl(
        productId: null == productId
            ? _value.productId
            : productId // ignore: cast_nullable_to_non_nullable
                  as String,
        productName: null == productName
            ? _value.productName
            : productName // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        unitPrice: null == unitPrice
            ? _value.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationItemImpl implements _ReservationItem {
  const _$ReservationItemImpl({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unitPrice,
  });

  factory _$ReservationItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationItemImplFromJson(json);

  @override
  final String productId;
  @override
  final String productName;
  @override
  final int quantity;
  @override
  final int unitPrice;

  @override
  String toString() {
    return 'ReservationItem(productId: $productId, productName: $productName, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, productName, quantity, unitPrice);

  /// Create a copy of ReservationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationItemImplCopyWith<_$ReservationItemImpl> get copyWith =>
      __$$ReservationItemImplCopyWithImpl<_$ReservationItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationItemImplToJson(this);
  }
}

abstract class _ReservationItem implements ReservationItem {
  const factory _ReservationItem({
    required final String productId,
    required final String productName,
    required final int quantity,
    required final int unitPrice,
  }) = _$ReservationItemImpl;

  factory _ReservationItem.fromJson(Map<String, dynamic> json) =
      _$ReservationItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get productName;
  @override
  int get quantity;
  @override
  int get unitPrice;

  /// Create a copy of ReservationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationItemImplCopyWith<_$ReservationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
