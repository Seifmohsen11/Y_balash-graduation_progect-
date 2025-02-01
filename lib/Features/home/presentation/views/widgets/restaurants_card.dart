import 'package:flutter/material.dart';

class RestaurantsCard extends StatelessWidget {
  const RestaurantsCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.color,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * (16 / 430)),
      child: Container(
        height: screenHeight * (273 / 932),
        width: screenWidth * (248 / 430),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Container(
              height: screenHeight * (136.5 / 932),
              width: screenWidth * (248 / 430),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: color, width: .5),
                  borderRadius: BorderRadius.circular(56),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
