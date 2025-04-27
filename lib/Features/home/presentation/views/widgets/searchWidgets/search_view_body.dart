import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(child: Text("search view")),
    );
  }
}
