import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummary extends StatelessWidget {
  final int itemCount;
  final double totalPrice;
  final double discount;
  final double importCharges;
  final double grandTotal;

  const OrderSummary({
    super.key,
    required this.itemCount,
    required this.totalPrice,
    required this.discount,
    required this.grandTotal,
    required this.importCharges,
  });

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
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
          buildRow(
            "Items ($itemCount)",
            '${totalPrice.toStringAsFixed(2)} EGP',
          ),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow(
            "Import Charges",
            '${importCharges.toStringAsFixed(2)} EGP',
          ),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow(
            "Discount",
            '${discount.toStringAsFixed(2)} EGP',
          ),
          SizedBox(height: getProportionalHeight(context, 4)),
          Divider(
              thickness: getProportionalHeight(context, 1.2),
              color: Colors.grey),
          SizedBox(height: getProportionalHeight(context, 4)),
          buildRow("Total Price", '${grandTotal.toStringAsFixed(2)} EGP',
              isBold: true),
        ],
      ),
    );
  }

  Widget buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.black : Colors.grey[600],
            )),
        Text(value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.green[800] : Colors.grey[600],
            )),
      ],
    );
  }
}
