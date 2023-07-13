import 'package:bagstore/models/product.dart';
import 'package:bagstore/widgets/grid_display.dart';
import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class GridItem extends StatelessWidget {
  const GridItem(this.product, {super.key});
  final Product product;
  void goToDetailScreen(BuildContext context, Product product) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailScreen(product),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToDetailScreen(context, product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: GridDisplay(product)),
          Text(
            product.title,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          Text(
            '\$${product.price.toString()}',
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(221, 48, 48, 48)),
          )
        ],
      ),
    );
  }
}
