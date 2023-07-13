import 'dart:io';

import 'package:bagstore/models/product.dart';
import 'package:flutter/material.dart';

class GridDisplay extends StatelessWidget {
  const GridDisplay(this.product, {super.key});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: product.color,
        width: double.infinity,
        child: Hero(
          tag: product.id,
          child: product.image.startsWith('assets')
              ? Image.asset(
                  product.image,
                  fit: BoxFit.fitHeight,
                )
              : Image.file(
                  File(product.image),
                  fit: BoxFit.fitHeight,
                ),
        ),
      ),
    );
  }
}
