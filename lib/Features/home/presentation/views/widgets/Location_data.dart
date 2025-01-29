import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        SizedBox(
          child: Center(
              child: Text(
            'Current Location',
            style: TextStyle(
                color: Color(0xff8A8A8A), fontFamily: kIneraFont, fontSize: 20),
          )),
        ),
        SizedBox(
          child: Center(
              child: Text(
            'Ismailia , Egypt',
            style: TextStyle(
                color: Color(0xffFFC433), fontFamily: kIneraFont, fontSize: 20),
          )),
        ),
      ],
    );
  }
}
