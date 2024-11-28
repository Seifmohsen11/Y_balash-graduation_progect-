import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoName extends StatelessWidget {
  const LogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 90.h, // Responsive image height (optional)
        width: 253.h, // Responsive image width (optional)
        child: Image.asset(
          'assets/images/y-balashName.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
