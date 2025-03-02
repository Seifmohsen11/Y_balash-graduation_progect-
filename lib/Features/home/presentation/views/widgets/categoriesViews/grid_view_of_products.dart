import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';

class GridViewOfProducts extends StatelessWidget {
  const GridViewOfProducts({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.products,
  });

  final double screenWidth;
  final double screenHeight;
  final List<dynamic> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * (16 / 430)),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 10,
          mainAxisExtent: 240,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return ProductCard(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image: product['imageUrl'],
            title: product['name'],
            description: product['quantity'],
            price: product['price'],
          );
        },
      ),
    );
  }
}
