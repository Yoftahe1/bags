import 'package:bagstore/models/product.dart';
import 'package:bagstore/provider/carts_provider.dart';
import 'package:bagstore/widgets/add_elevated_button.dart';
import 'package:bagstore/widgets/cart_icon.dart';
import 'package:bagstore/widgets/grid_display.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen(this.product, {super.key});
  final Product product;

  void addToCartScreen(BuildContext context, WidgetRef ref) {
    final newProduct = Product(
        id: product.id,
        image: product.image,
        title: product.title,
        price: product.price,
        description: product.description,
        color: product.color);
    ref.read(cartProvider.notifier).addProduct(newProduct);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
        actions: const [CartIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GridDisplay(product),
              const SizedBox(height: 10),
              Text(
                product.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
              ),
              const SizedBox(height: 5),
              Text(
                product.description,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Price:",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "\$${product.price.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                        color: product.color),
                  ),
                ],
              ),
              AddElevatedButton(
                color: product.color,
                title: 'Add To Cart',
                onPress: () {
                  addToCartScreen(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
