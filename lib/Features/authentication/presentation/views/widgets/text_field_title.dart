import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfTextField extends StatelessWidget {
  const TitleOfTextField({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: screenWidth * (16 / 430),
        ),
        SizedBox(
          height: screenHeight * (29 / 932),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: kIneraFont,
                fontWeight: FontWeight.w400,
                fontSize: screenWidth * (24 / 430),
                color: kTextFieldAndButtomColor),
          ),
        ),
      ],
    );
  }
}
