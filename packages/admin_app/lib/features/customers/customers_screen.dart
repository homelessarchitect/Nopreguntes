import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:admin_app/features/customers/customers_view_model.dart';
import 'package:shared/domain/models/customer.dart';

class CustomersScreen extends ConsumerWidget {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customersAsync = ref.watch(customersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de Clientes')),
      body: customersAsync.when(
        data: (customers) => customers.isEmpty
            ? const Center(child: Text('No hay clientes registrados.'))
            : ListView.builder(
                itemCount: customers.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemBuilder: (context, index) {
                  final customer = customers[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        customer.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        '${customer.phone}${customer.email != null ? ' - ${customer.email}' : ''}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // TODO: Navigate to details/edit
                        _showCustomerDialog(context, ref, customer: customer);
                      },
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCustomerDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCustomerDialog(
    BuildContext context,
    WidgetRef ref, {
    Customer? customer,
  }) {
    final nameController = TextEditingController(text: customer?.name);
    final phoneController = TextEditingController(text: customer?.phone);
    final emailController = TextEditingController(text: customer?.email);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(customer == null ? 'Nuevo Cliente' : 'Editar Cliente'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Teléfono'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email (Opcional)'),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final phone = phoneController.text.trim();
              final email = emailController.text.trim();

              if (name.isEmpty || phone.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Nombre y teléfono son requeridos'),
                  ),
                );
                return;
              }

              final newCustomer =
                  customer?.copyWith(
                    name: name,
                    phone: phone,
                    email: email.isEmpty ? null : email,
                  ) ??
                  Customer(
                    id: '', // Will be set by Firestore
                    name: name,
                    phone: phone,
                    email: email.isEmpty ? null : email,
                    createdAt: DateTime.now(),
                  );

              if (customer == null) {
                await ref
                    .read(customersViewModelProvider.notifier)
                    .createCustomer(newCustomer);
              } else {
                await ref
                    .read(customersViewModelProvider.notifier)
                    .updateCustomer(newCustomer);
              }

              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
