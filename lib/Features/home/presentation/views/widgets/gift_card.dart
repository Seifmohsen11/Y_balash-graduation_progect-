import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class GiftCard extends StatelessWidget {
  const GiftCard(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * (16 / 430)),
      child: Container(
        height: screenHeight * (168 / 932),
        width: screenWidth * (229 / 430),
        decoration: BoxDecoration(
            color: const Color(0xff0F4273),
            borderRadius: BorderRadius.circular(screenWidth * (24 / 430))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * (30 / 932),
                  left: screenWidth * (7 / 430)),
              child: Container(
                height: screenHeight * (21 / 932),
                width: screenWidth * (91 / 430),
                decoration: BoxDecoration(
                    color: const Color(0xffA6E4E1),
                    borderRadius:
                        BorderRadius.circular(screenWidth * (4 / 430))),
                child: Center(
                  child: Text(
                    'Free delivery',
                    style: TextStyle(
                        color: const Color(0xff0F4273),
                        fontFamily: kIneraFont,
                        fontSize: screenWidth * (13 / 430)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * (7 / 430), top: screenHeight * (7 / 932)),
              child: Text(
                'Get up to 50% off on delivery when you redeem your points',
                style: TextStyle(
                    color: const Color(0xffA6E4E1),
                    fontFamily: kIneraFont,
                    fontSize: screenWidth * (13 / 430)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: screenWidth * (15 / 430),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: screenHeight * (58 / 932),
                      width: screenWidth * (62 / 430),
                      child: Image.asset('assets/images/giftImage.png'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
