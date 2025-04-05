import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/success_after_payment_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({super.key});

  @override
  State<PaymentMethodViewBody> createState() => _PaymentMethodViewBodyState();
}

class _PaymentMethodViewBodyState extends State<PaymentMethodViewBody> {
  bool isProcessing = false;

  Future<void> handlePayment() async {
    setState(() {
      isProcessing = true;
    });

    try {
      // get the token
      String? token = await SharedPrefHelper.getToken();
      if (token == null) throw Exception('Authentication token not found');

      // calling API to get clientSecret
      final response =
          await ApiService(baseUrl: 'https://y-balash.vercel.app/api/')
              .post(endpoint: 'purchases/payment', token: token, body: {});

      String clientSecret = response['clientSecret'];

      // start payment proccess
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Y-Balash',
        ),
      );

      // present payment sheet
      await Stripe.instance.presentPaymentSheet();

      showSnackBar(context, 'payment Successful',
          backgroundColor: Colors.green);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return SuccessAfterPaymentView();
      }));
    } catch (e) {
      print(e);
      showSnackBar(context, 'Payment Failed', backgroundColor: Colors.red);
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

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
              onTap: handlePayment,
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
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return SuccessAfterPaymentView();
                }));
              },
              borderRadiusSize: getProportionalWidth(context, 32),
            )
          ],
        ),
      ),
    );
  }
}
