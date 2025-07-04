import 'package:flutter/material.dart';

class RestaurantsCard extends StatelessWidget {
  const RestaurantsCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.color,
    required this.onTap,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * (16 / 430)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: screenHeight * (273 / 932),
          width: screenWidth * (248 / 430),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              screenWidth * (18 / 430),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: screenHeight * (136.5 / 932),
                width: screenWidth * (248 / 430),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(
                    screenWidth * (18 / 430),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: screenHeight * (100 / 932),
                  width: screenHeight * (100 / 932),
                  decoration: BoxDecoration(
                    border: Border.all(color: color, width: .5),
                    borderRadius: BorderRadius.circular(
                      screenWidth * (56 / 430),
                    ), // Border radius for Container
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      screenWidth * (56 / 430),
                    ), // Apply border radius to image
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
