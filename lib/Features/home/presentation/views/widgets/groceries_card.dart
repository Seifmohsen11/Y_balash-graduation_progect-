import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class GroceriesCard extends StatelessWidget {
  const GroceriesCard(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.color,
      required this.image,
      required this.label});
  final double screenHeight;
  final double screenWidth;
  final Color color;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * (15 / 430)),
      child: Container(
        height: screenHeight * (101 / 932),
        width: screenWidth * (247 / 430),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * (5 / 430)),
          child: Row(
            children: [
              SizedBox(
                height: screenHeight * (57 / 930),
                width: screenWidth * (88 / 430),
                child: Center(
                  child: Image.asset(image),
                ),
              ),
              // SizedBox(
              //   width: screenWidth * (5 / 430),
              // ),
              Text(
                label,
                style: TextStyle(
                    fontFamily: kAbyssinicaSIL,
                    fontSize: screenWidth * (20 / 430),
                    color: const Color(0xff3E423F)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
