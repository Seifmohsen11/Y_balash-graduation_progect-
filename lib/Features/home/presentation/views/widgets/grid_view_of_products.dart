import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';

class GridViewOfProducts extends StatelessWidget {
  const GridViewOfProducts({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.description,
    required this.price,
    required this.title,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * (16 / 430)),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 10,
            mainAxisExtent: 240,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              image: image,
              title: title,
              description: description,
              price: price,
            );
          },
        ),
      ),
    );
  }
}
