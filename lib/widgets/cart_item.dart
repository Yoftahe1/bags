import 'package:bagstore/models/product.dart';
import 'package:bagstore/provider/carts_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItem extends ConsumerStatefulWidget {
  const CartItem(this.product, {super.key});
  final Product product;
  @override
  ConsumerState<CartItem> createState() => _CartItemState();
}

class _CartItemState extends ConsumerState<CartItem> {
  void removeFromCart() {
    ref.read(cartProvider.notifier).removeProduct(widget.product);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text('Removed ${widget.product.title}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        removeFromCart();
      },
      background: Container(
        color: const Color.fromARGB(100, 255, 0, 0),
        // margin: EdgeInsets.symmetric(horizontal: 10),
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white),
              Text('Remove', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(widget.product.id),
      child: ListTile(
        shape:
            const BorderDirectional(bottom: BorderSide(color: Colors.black12)),
        visualDensity: const VisualDensity(vertical: 4),
        leading: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.product.color,
            ),
            child: Image.asset(widget.product.image)),
        title: Text(
          widget.product.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        trailing: Text('\$${widget.product.price.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
