import 'package:bagstore/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]); //initial data
  void addProduct(Product product) {
    final isInCart = state.where((element) => element.id == product.id);
    if (isInCart.isEmpty) {
      state = [...state, product];
    }
  }

  void removeProduct(Product product) {
    state = state.where((element) => element.id != product.id).toList();
  }

  void removeAllProducts() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) {
    return CartNotifier();
  },
);
