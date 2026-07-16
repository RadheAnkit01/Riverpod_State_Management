import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/favourite%20product/product_provider_controller.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(productProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final products = ref.watch(productProvider);
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return ListTile(
                      leading: InkWell(
                        onTap: () {
                          notifier.toggleFavourite(product.id);
                        },
                        child: Icon(
                          product.favourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                      title: Text(product.productName, style: TextStyle()),
                      subtitle: Text(product.price.toString()),
                      trailing: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Drawer();
                            },
                            icon: Icon(Icons.edit, color: Colors.red),
                          ),
                          IconButton(
                            onPressed: () {
                              notifier.deleteProduct(product.id);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
