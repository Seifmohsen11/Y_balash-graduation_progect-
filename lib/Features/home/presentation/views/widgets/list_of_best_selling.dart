import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';

class ListOfBestSelling extends StatelessWidget {
  const ListOfBestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image: 'assets/images/pepper.png',
            title: 'Red Pepper',
            description: '1Kg, Priceg',
            price: '4.99',
          );
        });
  }
}
