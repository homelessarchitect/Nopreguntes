import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared/presentation/theme.dart';
import 'package:shared/domain/models/product.dart';
import 'package:admin_app/features/menu_editor/menu_editor_view_model.dart';
import 'package:uuid/uuid.dart';

class MenuEditorScreen extends ConsumerStatefulWidget {
  const MenuEditorScreen({super.key});

  @override
  ConsumerState<MenuEditorScreen> createState() => _MenuEditorScreenState();
}

class _MenuEditorScreenState extends ConsumerState<MenuEditorScreen> {
  void _addCategory() {
    // Show dialog to add category
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final priceController = TextEditingController();
        return AlertDialog(
          title: const Text('Nueva Categoría'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Precio Base'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final cat = ProductCategory(
                  id: const Uuid().v4(),
                  name: nameController.text,
                  basePrice: int.tryParse(priceController.text) ?? 0,
                );
                ref
                    .read(menuEditorViewModelProvider.notifier)
                    .saveCategory(cat);
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void _addProduct(ProductCategory category) {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        return AlertDialog(
          title: Text('Nuevo producto en ${category.name}'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nombre del producto'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                final product = Product(
                  id: const Uuid().v4(),
                  categoryId: category.id,
                  name: nameController.text,
                );

                // Typically you'd save the product to a subcollection or update the category array.
                // We'll update the category array for simplicity here:
                final updatedCategory = category.copyWith(
                  products: [...category.products, product],
                );
                ref
                    .read(menuEditorViewModelProvider.notifier)
                    .saveCategory(updatedCategory);

                Navigator.pop(context);
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteCategory(ProductCategory category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Eliminar Categoría?'),
        content: Text(
          'Esto eliminará "${category.name}" y todos sus productos.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(menuEditorViewModelProvider.notifier)
                  .deleteCategory(category.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _removeProduct(ProductCategory category, Product product) {
    final updatedCategory = category.copyWith(
      products: category.products.where((p) => p.id != product.id).toList(),
    );
    ref
        .read(menuEditorViewModelProvider.notifier)
        .saveCategory(updatedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(adminCategoriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Menú'),
        backgroundColor: AppTheme.primaryCoffee,
        foregroundColor: Colors.white,
      ),
      body: categoriesAsync.when(
        data: (categories) {
          if (categories.isEmpty) {
            return const Center(child: Text('No hay categorías en el menú.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          cat.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                        ),
                        onPressed: () => _confirmDeleteCategory(cat),
                      ),
                    ],
                  ),
                  subtitle: Text('Precio base: \$${cat.basePrice}'),
                  children: [
                    ...cat.products.map(
                      (p) => ListTile(
                        leading: const Icon(Icons.circle, size: 8),
                        title: Text(p.name),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.grey,
                          ),
                          onPressed: () => _removeProduct(cat, p),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('Añadir Producto'),
                        onPressed: () => _addProduct(cat),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addCategory,
        icon: const Icon(Icons.add),
        label: const Text('Categoría'),
        backgroundColor: AppTheme.accentGold,
      ),
    );
  }
}
