import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        height: screenHeight * (90 / 932),
        width: screenWidth * (253 / 430),
        child: Image.asset(
          'assets/images/y-balashName.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
