import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class RedeemPointsButtom extends StatelessWidget {
  const RedeemPointsButtom({super.key});

  get screenHeight => null;

  get screenWidth => null;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return CustomButtom(
      label: 'Redeem your points',
      height: getProportionalHeight(context, 57),
      width: getProportionalWidth(context, 398),
      backgorundColor: kTextFieldAndButtomColor,
      textColor: Colors.white,
      borderColor: kTextFieldAndButtomColor,
      onTap: () {},
      borderRadiusSize: getProportionalWidth(context, 14),
    );
  }
}
