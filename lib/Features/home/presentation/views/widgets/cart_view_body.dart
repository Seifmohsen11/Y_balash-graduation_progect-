import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(title: Text('Cart view')),
    );
  }
}
