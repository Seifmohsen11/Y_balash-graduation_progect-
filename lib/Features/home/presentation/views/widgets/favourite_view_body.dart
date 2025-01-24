import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(child: Text("favourite view")),
    );
  }
}
