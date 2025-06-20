import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_points_value_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class RedeemPointsButtom extends StatefulWidget {
  const RedeemPointsButtom({super.key, required this.onPointsRedeemed});
  final void Function(bool usePoints) onPointsRedeemed;
  @override
  State<RedeemPointsButtom> createState() => _RedeemPointsButtomState();
}

class _RedeemPointsButtomState extends State<RedeemPointsButtom> {
  int coins = 0;
  double discountFromPoints = 0.0;
  bool isLoading = false;
  bool hasRedeemed = false;

  @override
  void initState() {
    super.initState();
    fetchCoinsAndDiscount();
  }

  Future<void> fetchCoinsAndDiscount() async {
    final pointsValue = await getPointsValue();
    final fetchedCoins = pointsValue['points'];
    final fetchedDiscount = pointsValue['equivalentEgp'];

    if (!mounted) return;
    setState(() {
      coins = fetchedCoins;
      discountFromPoints = fetchedDiscount;
    });
  }

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your $coins Points = ${discountFromPoints.toStringAsFixed(2)} EGP",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: kTextFieldAndButtomColor),
            ),
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Wanna redeem them?",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        actionsPadding: EdgeInsets.only(right: 12.w, bottom: 6.h),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop(); // Use dialogContext
              if (coins >= 10) {
                setState(() => hasRedeemed = true); // Mark as redeemed
                widget.onPointsRedeemed(true);
              } else {
                showSnackBar(context, 'Points must be 10 or more',
                    backgroundColor: Colors.red);
              }
            },
            child: Text(
              "Redeem",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: kTextFieldAndButtomColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Use dialogContext
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SpinKitThreeBounce(
            color: Colors.blue,
            size: 28.h,
          )
        : CustomButtom(
            label: hasRedeemed ? 'Points Redeemed' : 'Redeem your points',
            height: getProportionalHeight(context, 57),
            width: getProportionalWidth(context, 398),
            backgorundColor:
                hasRedeemed ? Colors.grey : kTextFieldAndButtomColor,
            textColor: Colors.white,
            borderColor: hasRedeemed ? Colors.grey : kTextFieldAndButtomColor,
            onTap: hasRedeemed ? () {} : _showConfirmationDialog,
            borderRadiusSize: getProportionalWidth(context, 14),
          );
  }
}
