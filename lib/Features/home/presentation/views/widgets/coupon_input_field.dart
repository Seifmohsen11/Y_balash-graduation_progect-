import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class CouponInputField extends StatelessWidget {
  const CouponInputField({super.key});

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(getProportionalWidth(context, 4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionalWidth(context, 12)),
                border: InputBorder.none,
                hintText: "Enter Coupon Code",
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kTextFieldAndButtomColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(getProportionalWidth(context, 4)),
                bottomRight: Radius.circular(getProportionalWidth(context, 4)),
              ),
            ),
            child: TextButton(
              onPressed: () {
                // Handle apply coupon
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
              child: const Text(
                "Apply",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
