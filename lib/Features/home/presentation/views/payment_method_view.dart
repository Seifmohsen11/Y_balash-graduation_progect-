import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/paymentWidgets/payment_method_view_body.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});
  static String id = 'paymentMethodView';
  @override
  Widget build(BuildContext context) {
    final double totalPrice =
        ModalRoute.of(context)!.settings.arguments as double;

    return PaymentMethodViewBody(totalPrice: totalPrice);
  }
}
