import 'package:bagstore/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super(products);
  void addProduct(Product newProduct) {
    state = [newProduct, ...state];
  }
}

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});
