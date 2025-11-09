import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/model/products_model.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toSet();
  }

  void clearCart() {
    state = <Product>{};
  }
}

@riverpod
dynamic cartTotalPrice(ref) {
  final cartProducts = ref.watch(cartProvider);
  return cartProducts.fold(0, (total, product) => total + product.price);
}
