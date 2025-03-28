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

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            indent: getProportionalWidth(context, 22),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: textPadding),
          child: Text(
            text,
            style: TextStyle(
                color: dividerColor,
                fontWeight: FontWeight.w400,
                fontFamily: kInriaSansFont),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
            thickness: thickness,
            endIndent: getProportionalWidth(context, 22),
          ),
        ),
      ],
    );
  }
}
