import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurants_card.dart';

class ListOfRestaurants extends StatelessWidget {
  const ListOfRestaurants(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return RestaurantsCard(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          image: 'assets/images/frio.png',
          color: colors[index % colors.length], // Cycle through colors
        );
      },
    );
  }
}

List<Color> colors = [
  Color(0xff8A8A8A), // Grey
  Color(0xff003366), // Dark Blue
];
