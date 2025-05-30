import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class SuccessAfterPaymentView extends StatelessWidget {
  const SuccessAfterPaymentView({super.key});

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: getProportionalHeight(context, 150),
                width: getProportionalWidth(context, 150),
                child: Lottie.asset(
                    frameRate: FrameRate.max,
                    repeat: true,
                    reverse: true,
                    'assets/icons/animation_done_1.json',
                    fit: BoxFit.fill)),
            Text(
              'Success',
              style: TextStyle(
                  color: kTextFieldAndButtomColor,
                  fontSize: getProportionalWidth(context, 24),
                  fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 1500.ms).slideY(begin: -1, end: 0),
            Text(
              'thank you for shopping using Y-BALASH',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            )
                .animate()
                .fadeIn(delay: 750.ms, duration: 750.ms)
                .slideY(begin: -1, end: 0),
            SizedBox(
              height: getProportionalHeight(context, 16),
            ),
            CustomButtom(
                    label: 'Back To Order',
                    height: getProportionalHeight(context, 57),
                    width: getProportionalWidth(context, 343),
                    backgorundColor: kTextFieldAndButtomColor,
                    textColor: Colors.white,
                    borderColor: kTextFieldAndButtomColor,
                    onTap: () {
                      Navigator.popAndPushNamed(context, MainView.id);
                    },
                    borderRadiusSize: getProportionalWidth(context, 16))
                .animate()
                .fadeIn(duration: 1500.ms)
                .moveY(begin: 30, end: 0)
          ],
        ),
      ),
    );
  }
}
