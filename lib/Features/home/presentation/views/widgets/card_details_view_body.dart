import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/widgets/title_and_text_field.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class CardDetailsViewBody extends StatelessWidget {
  const CardDetailsViewBody({super.key});

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
            EdgeInsets.symmetric(horizontal: getProportionalWidth(context, 14)),
        child: Column(
          children: [
            SizedBox(height: getProportionalHeight(context, 42)),
            AppBarOfCartView(
                screenWidth: screenWidth,
                iconImage: 'assets/icons/Arrow.png',
                title: 'Payment Method',
                onPressed: () {
                  Navigator.pop(context);
                }),
            SizedBox(height: getProportionalHeight(context, 12)),
            const TitleAndTextField(
              title: 'Email Address',
              titleFontSize: 18,
              horizontalPaddingOfField: 2,
              spaceBetweenTitleAndField: 4,
              hintText: 'Enter your email address',
              backgroundColor: Colors.white,
              borderColor: Colors.white,
            ),
            SizedBox(height: getProportionalHeight(context, 8)),
            Stack(children: [
              const TitleAndTextField(
                title: 'Card Number',
                titleFontSize: 18,
                horizontalPaddingOfField: 2,
                spaceBetweenTitleAndField: 4,
                hintText: '1234 1234 1234 1234',
                backgroundColor: Colors.white,
                borderColor: Colors.white,
              ),
              Positioned(
                  right: 16,
                  top: 39,
                  child: Image.asset(
                    'assets/icons/visa.png',
                    height: getProportionalHeight(context, 42),
                    width: getProportionalWidth(context, 100),
                  ))
            ]),
            SizedBox(height: getProportionalHeight(context, 12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getProportionalWidth(context, 190),
                  child: const TitleAndTextField(
                    title: 'Expiration Date',
                    horizontalPaddingOfField: 2,
                    titleFontSize: 18,
                    spaceBetweenTitleAndField: 4,
                    hintText: 'MM / YY',
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: getProportionalWidth(context, 190),
                  child: const TitleAndTextField(
                    title: 'Security Code',
                    horizontalPaddingOfField: 2,
                    titleFontSize: 18,
                    spaceBetweenTitleAndField: 4,
                    hintText: 'CVC',
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionalHeight(context, 81)),
            CustomButtom(
                label: 'Pay Now',
                height: getProportionalHeight(context, 54),
                width: getProportionalWidth(context, 260),
                backgorundColor: kTextFieldAndButtomColor,
                textColor: Colors.white,
                borderColor: kTextFieldAndButtomColor,
                onTap: () {},
                borderRadiusSize: getProportionalWidth(context, 12))
          ],
        ),
      ),
    );
  }
}
