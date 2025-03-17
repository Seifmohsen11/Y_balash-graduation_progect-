import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key, required this.height, required this.width});
  final double height;
  final double width;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          'assets/images/y-balashName.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
