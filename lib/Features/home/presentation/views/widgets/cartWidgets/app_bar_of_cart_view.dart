import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfCartView extends StatelessWidget {
  const AppBarOfCartView({
    super.key,
    required this.screenWidth,
    required this.iconImage,
    required this.title,
    required this.onPressed,
  });

  final double screenWidth;
  final String iconImage;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              onPressed();
            },
            icon: SvgPicture.asset(iconImage)),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * (10 / 430), right: screenWidth * (10 / 430)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: screenWidth * (36 / 430),
                    fontFamily: kAbyssinicaSIL,
                    color: kTextFieldAndButtomColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
