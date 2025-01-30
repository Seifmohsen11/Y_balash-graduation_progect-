import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CusttomTextDivider extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final double thickness;
  final double textPadding;

  const CusttomTextDivider({
    super.key,
    required this.text,
    this.dividerColor = kmainTextColor,
    this.thickness = .5,
    this.textPadding = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            indent: screenWidth * (22 / 430),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            text,
            style: TextStyle(
                color: dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: kIneraFont),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            endIndent: screenWidth * (22 / 430),
          ),
        ),
      ],
    );
  }
}
