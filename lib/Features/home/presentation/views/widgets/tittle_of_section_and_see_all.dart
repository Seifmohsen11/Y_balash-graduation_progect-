import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitleOfSectionAndSeeAll extends StatelessWidget {
  const TitleOfSectionAndSeeAll(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.label,
      required this.onTap,
      required this.spaceBetween});
  final double screenHeight;
  final double screenWidth;
  final String label;
  final VoidCallback onTap;
  final double spaceBetween;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * (38 / 932),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
                color: kTextFieldAndButtomColor,
                fontFamily: kAbyssinicaSIL,
                fontSize: screenWidth * (24 / 430)),
          ),
          SizedBox(
            width: spaceBetween,
          ),
          TextButton(
            onPressed: onTap,
            child: Text(
              "See all",
              style: TextStyle(
                  color: kTextFieldAndButtomColor,
                  fontFamily: kAbyssinicaSIL,
                  fontSize: screenWidth * (16 / 430)),
            ),
          )
        ],
      ),
    );
  }
}
