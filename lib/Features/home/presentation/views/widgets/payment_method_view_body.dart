import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/card_details_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class PaymentMethodViewBody extends StatelessWidget {
  const PaymentMethodViewBody({super.key});

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalWidth(context, 16)),
        child: Column(
          children: [
            SizedBox(height: getProportionalHeight(context, 42)),
            AppBarOfCartView(
              screenWidth: screenWidth,
              iconImage: 'assets/icons/Arrow.png',
              title: 'Payment Method',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: getProportionalHeight(context, 44)),
            CustomButtom(
              label: 'Online Payment',
              height: getProportionalHeight(context, 58),
              width: getProportionalWidth(context, 375),
              backgorundColor: Colors.white,
              textColor: kTextFieldAndButtomColor,
              borderColor: Colors.grey.withOpacity(.5),
              onTap: () {
                Navigator.pushNamed(context, CardDetailsView.id);
              },
              borderRadiusSize: getProportionalWidth(context, 32),
            ),
            SizedBox(height: getProportionalHeight(context, 14)),
            CustomButtom(
              label: 'Cash on delivery',
              height: getProportionalHeight(context, 58),
              width: getProportionalWidth(context, 375),
              backgorundColor: Colors.white,
              textColor: kTextFieldAndButtomColor,
              borderColor: Colors.grey.withOpacity(.5),
              onTap: () {},
              borderRadiusSize: getProportionalWidth(context, 32),
            )
          ],
        ),
      ),
    );
  }
}
