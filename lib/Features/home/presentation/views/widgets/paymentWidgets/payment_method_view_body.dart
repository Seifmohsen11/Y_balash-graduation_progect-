import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/paymentWidgets/success_after_payment_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_points_after_payment_service.dart';
import 'package:y_balash/core/data/services/home/cash_payment_service.dart';
import 'package:y_balash/core/helper/api.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class PaymentMethodViewBody extends StatefulWidget {
  const PaymentMethodViewBody({super.key, required this.totalPrice});
  final double totalPrice;

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
      print('total price = ${widget.totalPrice}');
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

      showSnackBar(
        context,
        'payment Successful',
        backgroundColor: Colors.green,
      );
      await addPointsAfterPayment(totalAmount: widget.totalPrice); //add points
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SuccessAfterPaymentView();
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

    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionalWidth(context, 16)),
          child: SafeArea(
            child: Column(
              children: [
                AppBarOfCartView(
                  screenWidth: screenWidth,
                  iconImage: 'assets/icons/arrow.svg',
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
                  onTap: () async {
                    try {
                      print('total price = ${widget.totalPrice}');
                      await cashPayment();
                      // await addPointsAfterPayment(            //اروي عملتها من عندها بعد م السيلر يعمل كونفيرم
                      //     totalAmount: widget.totalPrice); //add points
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SuccessAfterPaymentView();
                      }));
                    } catch (e) {
                      showSnackBar(context, 'Something went wrong, try again.',
                          backgroundColor: Colors.red);
                    }
                  },
                  borderRadiusSize: getProportionalWidth(context, 32),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
