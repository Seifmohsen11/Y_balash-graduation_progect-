import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/gift_card.dart';

class ListOfGiftCards extends StatelessWidget {
  const ListOfGiftCards(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * (165 / 932),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GiftCard(
                screenHeight: screenHeight, screenWidth: screenWidth);
          }),
    );
  }
}
