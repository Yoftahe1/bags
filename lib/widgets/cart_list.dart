import 'package:bagstore/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bagstore/provider/carts_provider.dart';

class CartList extends ConsumerStatefulWidget {
  const CartList({super.key});

  @override
  ConsumerState<CartList> createState() => _CartListState();
}

class _CartListState extends ConsumerState<CartList> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(cartProvider);
    return ListView.builder(
      padding: const EdgeInsets.only(
        bottom: 85,
      ),
      itemBuilder: (context, index) => CartItem(products[index]),
      itemCount: products.length,
    );
  }
}
