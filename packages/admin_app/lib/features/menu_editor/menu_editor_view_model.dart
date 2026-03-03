import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/domain/models/product.dart';
import 'package:shared/providers.dart';

part 'menu_editor_view_model.g.dart';

@riverpod
Future<List<ProductCategory>> adminCategories(Ref ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getCategories();
}

@riverpod
class MenuEditorViewModel extends _$MenuEditorViewModel {
  @override
  bool build() {
    return false;
  }

  Future<void> saveCategory(ProductCategory category) async {
    state = true;
    try {
      final repo = ref.read(productRepositoryProvider);
      await repo.saveCategory(category);
      ref.invalidate(adminCategoriesProvider);
    } finally {
      state = false;
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    state = true;
    try {
      final repo = ref.read(productRepositoryProvider);
      await repo.deleteCategory(categoryId);
      ref.invalidate(adminCategoriesProvider);
    } finally {
      state = false;
    }
  }
}
