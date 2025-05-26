import 'package:flutter/material.dart';
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
              height: getProportionalHeight(context, 125),
              width: getProportionalWidth(context, 125),
              child: Image.asset(
                'assets/images/Success Icon.png',
                fit: BoxFit.fill, // أو BoxFit.fill حسب الحاجة
              ),
            ),
            Text(
              'Success',
              style: TextStyle(
                  color: kTextFieldAndButtomColor,
                  fontSize: getProportionalWidth(context, 24),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'thank you for shopping using Y-BALASH',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionalWidth(context, 12),
                  fontWeight: FontWeight.bold),
            ),
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
          ],
        ),
      ),
    );
  }
}
