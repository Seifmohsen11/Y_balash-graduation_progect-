import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/groceries_card.dart';

class ListOfGroceriesCard extends StatelessWidget {
  const ListOfGroceriesCard(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: labels.length,
      itemBuilder: (BuildContext context, int index) {
        return GroceriesCard(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          color: colors[index % colors.length], // Cycle colors
          image: images[index],
          label: labels[index],
        );
      },
    );
  }
}

List<Color> colors = [
  const Color(0xFFF5E3D0),
  const Color(0xFFC2E3CE),
];

List<String> images = [
  'assets/images/Dairy.png',
  'assets/images/bakery.png',
  'assets/images/desert.png',
  'assets/images/beverages.png'
];

List<String> labels = ['Dairy', 'Bakery', 'Desert', 'Beverages'];
