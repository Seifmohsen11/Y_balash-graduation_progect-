import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * (45 / 932),
      width: screenWidth * (45 / 430),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(24)),
      child: IconButton(
          onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
    );
  }
}
