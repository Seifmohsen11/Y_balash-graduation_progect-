import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text("account view"),
      ),
    );
  }
}
