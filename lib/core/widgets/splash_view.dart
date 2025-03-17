import 'dart:async';

import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/sign_up_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';
import 'package:y_balash/core/widgets/logo_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = "splashScreen";

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  bool showButton = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/shoping.png',
                width: getProportionalWidth(context, 386),
                height: getProportionalHeight(context, 452)),
            SizedBox(height: getProportionalHeight(context, 1)),
            LogoName(
              height: getProportionalHeight(context, 109),
              width: getProportionalWidth(context, 344),
            ),
            Text(
              "Your Go-To for Discounted",
              style: TextStyle(
                fontSize: getProportionalWidth(context, 20),
                color: Color(0xffFFC433),
                fontFamily: kInriaSansFont,
              ),
            ),
            Text(
              "Freshness",
              style: TextStyle(
                fontSize: getProportionalWidth(context, 20),
                color: const Color(0xffFFC433),
                fontFamily: kInriaSansFont,
              ),
            ),
            SizedBox(height: getProportionalHeight(context, 100)),
            if (showButton)
              CustomButtom(
                  label: 'Get started for free >',
                  height: getProportionalHeight(context, 58),
                  width: getProportionalWidth(context, 232),
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, SignUpView.id);
                  })
          ],
        ),
      ),
    );
  }
}
