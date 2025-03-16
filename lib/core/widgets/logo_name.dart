import 'package:flutter/material.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    double getProportionalHeight(BuildContext context, double originalHeight) {
      return (originalHeight / 932) * MediaQuery.of(context).size.height;
    }

    double getProportionalWidth(BuildContext context, double originalWidth) {
      return (originalWidth / 430) * MediaQuery.of(context).size.width;
    }

    return Center(
      child: SizedBox(
        height: getProportionalHeight(context, 90),
        width: getProportionalWidth(context, 253),
        child: Image.asset(
          'assets/images/y-balashName.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
