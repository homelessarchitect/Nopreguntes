// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$ProductCategoryImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  basePrice: (json['basePrice'] as num).toInt(),
  description: json['description'] as String?,
  isActive: json['isActive'] as bool? ?? true,
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ProductCategoryImplToJson(
  _$ProductCategoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'basePrice': instance.basePrice,
  'description': instance.description,
  'isActive': instance.isActive,
  'products': instance.products,
};

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      additionalPrice: (json['additionalPrice'] as num?)?.toInt(),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'additionalPrice': instance.additionalPrice,
      'isActive': instance.isActive,
    };
