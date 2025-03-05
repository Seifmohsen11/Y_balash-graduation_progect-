import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TodaysOfferCard extends StatelessWidget {
  const TodaysOfferCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.firstColor,
    required this.secondColor,
    required this.icon,
  });

  final double screenHeight;
  final double screenWidth;
  final Color firstColor;
  final Color secondColor;
  final AssetImage icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * (392 / 932),
      width: screenWidth * (191 / 430),
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(
          screenWidth * (18 / 430),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: screenHeight * (420 / 932) / 2,
            width: screenWidth * (210 / 430),
            decoration: BoxDecoration(
              color: firstColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    screenWidth * (18 / 430),
                  ),
                  topRight: Radius.circular(screenWidth * (18 / 430))),
            ),
          ),
          Positioned(
            top: screenHeight * (32 / 932),
            left: screenWidth * (10 / 430),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Discount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * (20 / 430),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * (48 / 430),
                    ),
                    ImageIcon(
                      icon,
                      size: screenWidth * (56 / 430),
                    )
                  ],
                ),
                SizedBox(
                  height: screenHeight * (7 / 932),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth * (48 / 430),
                    ),
                    Text(
                      '30 %',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * (32 / 430),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * (10 / 932),
                ),
                Text(
                  "Enjoy Discount all types of ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * (14 / 430),
                      fontFamily: kIneraFont),
                ),
                Text(
                  'Grocery & frozen item',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * (14 / 430),
                      fontFamily: kIneraFont),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * (32 / 932),
            left: screenWidth * (26 / 430),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: screenHeight * (160 / 932),
                    width: screenWidth * (160 / 430),
                    child: Image.asset('assets/images/milk.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
