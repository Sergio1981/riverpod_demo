import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/cart/cart_screen.dart';
import 'package:riverpod_demo/providers/cart_provider.dart';
import 'package:riverpod_demo/providers/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartProvider);

    final total = ref.watch(cartTotalPriceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: allProducts.length,
          itemBuilder: (context, index) {
            final product = allProducts[index];
            final contain = cartProducts.contains(allProducts[index]);

            return Column(
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                Text('\$${product.price}'),

                if (contain)
                  TextButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).removeProduct(product);
                    },
                    child: const Text('Remove from Cart'),
                  ),
                if (!contain)
                  TextButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).addProduct(product);
                    },
                    child: const Text('Add to Cart'),
                  ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total Price: \$${total}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
