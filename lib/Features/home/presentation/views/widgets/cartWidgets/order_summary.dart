import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  final int itemCount;
  final double totalPrice;
  final double shipping;

  const OrderSummary({
    super.key,
    required this.itemCount,
    required this.totalPrice,
    required this.shipping,
  });

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    double importCharges = totalPrice / 4;

    return Container(
      padding: EdgeInsets.all(getProportionalWidth(context, 16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getProportionalWidth(context, 8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow("Items ($itemCount)", '${totalPrice.toStringAsFixed(2)} EGP',
              Colors.grey[600]!),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow("Shipping", "$shipping" ' EGP', Colors.grey[600]!),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow(
              "Import charges", "$importCharges" ' EGP', Colors.grey[600]!),
          SizedBox(height: getProportionalHeight(context, 4)),
          Divider(
              thickness: getProportionalHeight(context, 1.2),
              color: Colors.grey),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow(
              "Total Price",
              "${((totalPrice) + (shipping) + (importCharges)).toStringAsFixed(2)}"
                  ' EGP',
              Colors.green[800]!,
              isBold: true),
        ],
      ),
    );
  }

  Widget buildRow(String title, String amount, Color color,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.h,
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16.h,
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
