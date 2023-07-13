import 'package:bagstore/provider/carts_provider.dart';
import 'package:bagstore/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});
  void goToCartScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CartScreen(),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartLength = ref.watch(cartProvider).length;
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            goToCartScreen(context);
          },
        ),
        cartLength > 0
            ? Positioned(
                bottom: 10,
                right: 7,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: Text(
                    cartLength.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
