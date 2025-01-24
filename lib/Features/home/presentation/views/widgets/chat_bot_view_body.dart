import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class ChatPotViewBody extends StatelessWidget {
  const ChatPotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text("chatBot view"),
      ),
    );
  }
}
