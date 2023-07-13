import 'package:bagstore/models/product.dart';
import 'package:bagstore/provider/carts_provider.dart';
import 'package:bagstore/screens/home_screen.dart';
import 'package:bagstore/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  num totalPrice(List<Product> cart) {
    num total = 0;
    cart.isEmpty
        ? total = 0
        : total = cart
            .map((e) => e.price)
            .reduce((value, element) => value + element);
    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var total = ref.watch(cartProvider.notifier).totalPrice();
    final cart = ref.watch(cartProvider);
    var total = totalPrice(cart);

    void goToHomeScreen(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
        centerTitle: true,
        actions: [
          Text('\$${total.toString()}',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          const SizedBox(width: 20),
        ],
      ),
      body: const CartList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Buy Now"),
        backgroundColor: Colors.black,
        extendedPadding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {
          goToHomeScreen(context);
          ref.read(cartProvider.notifier).removeAllProducts();
        },
      ),
    );
  }
}
