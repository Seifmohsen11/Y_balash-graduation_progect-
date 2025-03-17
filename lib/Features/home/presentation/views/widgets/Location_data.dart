import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * (12 / 932),
        ),
        SizedBox(
          child: Center(
              child: Text(
            'Current Location',
            style: TextStyle(
                color: const Color(0xff8A8A8A),
                fontFamily: kInriaSansFont,
                fontSize: screenWidth * (20 / 430)),
          )),
        ),
        SizedBox(
          child: Center(
              child: Text(
            'Ismailia , Egypt',
            style: TextStyle(
                color: const Color(0xffFFC433),
                fontFamily: kInriaSansFont,
                fontSize: screenWidth * (20 / 430)),
          )),
        ),
      ],
    );
  }
}
