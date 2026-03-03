import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    required String id,
    required String name,
    required int basePrice,
    String? description,
    @Default(true) bool isActive,
    @Default([]) List<Product> products,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String categoryId,
    required String name,
    String? description,
    int? additionalPrice, // if it costs more than the base category price
    @Default(true) bool isActive,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
