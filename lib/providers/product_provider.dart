import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/model/products_model.dart';

part 'product_provider.g.dart';

final List<Product> allProducts = [
  Product(id: 1, name: 'Product 1', price: 9.99),
  Product(id: 2, name: 'Product 2', price: 19.99),
  Product(id: 3, name: 'Product 3', price: 29.99),
  Product(id: 4, name: 'Product 4', price: 4.99),
];

@riverpod
List<Product> products(ref) {
  return allProducts;
}
