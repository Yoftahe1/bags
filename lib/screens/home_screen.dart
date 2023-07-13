import 'package:bagstore/provider/products_provider.dart';
import 'package:bagstore/screens/add_screen.dart';
import 'package:bagstore/screens/cart_screen.dart';
import 'package:bagstore/widgets/cart_icon.dart';
import 'package:bagstore/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  void goToAddScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const AddScreen(),
    ));
  }

  void goToCartScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CartScreen(),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bag Store"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              goToAddScreen(context);
            },
          ),
          const CartIcon()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 3.5),
          itemBuilder: (context, index) => GridItem(products[index]),
          itemCount: products.length,
        ),
      ),
    );
  }
}
