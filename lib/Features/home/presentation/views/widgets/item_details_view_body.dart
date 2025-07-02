import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_item_details.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_cart_service.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class ItemDetailsViewBody extends StatefulWidget {
  const ItemDetailsViewBody({
    super.key,
    required this.itemId,
    required this.onRemove,
    required this.title,
    required this.description,
    required this.finalPrice,
    required this.image,
    required this.isFavorite,
    required this.originalPrice,
    required this.cafeName,
    required this.description2,
  });
  final String itemId;
  final Function(String) onRemove;
  final String title;
  final String cafeName;
  final String description;
  final String description2;
  final String finalPrice;
  final String? originalPrice;
  final String image;
  final bool isFavorite;

  @override
  State<ItemDetailsViewBody> createState() => _ItemDetailsViewBodyState();
}

class _ItemDetailsViewBodyState extends State<ItemDetailsViewBody> {
  late int currentQuantity;
  bool isFavorite = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    currentQuantity = 1;
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await removeFromFavourite(widget.itemId);
      showSnackBar(context, 'Removed Successfully',
          backgroundColor: Colors.green);
    } else {
      await addToFavourite(widget.itemId);
      showSnackBar(context, 'Added Successfully',
          backgroundColor: Colors.green);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void updateQuantity(int newQuantity) async {
    if (newQuantity < 1) return;

    setState(() {
      currentQuantity = newQuantity;
    });
  }

  double? parsePrice(String? priceString) {
    if (priceString == null || priceString.trim().isEmpty) return null;

    try {
      final cleaned = priceString.replaceAll(RegExp(r'[^0-9.]'), '');
      return double.parse(cleaned);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double? originalPriceDouble = parsePrice(widget.originalPrice);

    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            const AppBarOfItemDetails(),
            SizedBox(
              height: getProportionalHeight(context, 30),
            ),
            Center(
              child: Image.network(
                widget.image,
                height: getProportionalHeight(context, 280),
                width: getProportionalWidth(context, 315),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: getProportionalHeight(context, 52),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionalWidth(context, 36),
                  right: getProportionalWidth(context, 16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: getProportionalWidth(context, 24),
                        color: kTextFieldAndButtomColor,
                        fontFamily: kLatoBold),
                  ),
                  IconButton(
                    onPressed: () {
                      toggleFavorite();
                    },
                    icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: getProportionalWidth(context, 36)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cafeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: getProportionalWidth(context, 20),
                      color: const Color.fromARGB(255, 102, 99, 99),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: getProportionalWidth(context, 320),
                  //       child: Text(
                  //         widget.description,
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //         style: TextStyle(
                  //             fontSize: getProportionalWidth(context, 20),
                  //             color: const Color.fromARGB(255, 102, 99, 99),
                  //             fontFamily: kLatoLight),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: getProportionalWidth(context, 320),
                        child: Text(
                          widget.description2,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: getProportionalWidth(context, 20),
                            color: const Color.fromARGB(255, 147, 140, 140),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionalHeight(context, 32),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: getProportionalWidth(context, 32)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: getProportionalWidth(context, 20)),
                      IconButton(
                          iconSize: getProportionalWidth(context, 32),
                          onPressed: () {
                            updateQuantity(currentQuantity - 1);
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                      Text(
                        "$currentQuantity",
                        style: TextStyle(
                          fontSize: getProportionalWidth(context, 18),
                        ),
                      ),
                      IconButton(
                          iconSize: getProportionalWidth(context, 32),
                          color: Colors.yellow,
                          onPressed: () {
                            updateQuantity(currentQuantity + 1);
                          },
                          icon: const Icon(Icons.add_circle_outline)),
                    ],
                  ),
                  Row(
                    children: [
                      if (originalPriceDouble != null)
                        Text(
                          "${(originalPriceDouble * currentQuantity).toStringAsFixed(2)} EGP",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xffBDB092),
                            decoration: TextDecoration.lineThrough,
                            decorationColor: const Color(0xffBDB092),
                          ),
                        ),
                      if (originalPriceDouble != null)
                        SizedBox(width: getProportionalWidth(context, 8)),
                      Text(
                        "${(double.parse(widget.finalPrice.replaceAll(RegExp(r'[^0-9.]'), '')) * currentQuantity).toStringAsFixed(2)} EGP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: const Color(0xFF1C573E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: Center(
                child: CustomButtom(
                  label: 'Add to cart',
                  height: getProportionalHeight(context, 46),
                  width: getProportionalWidth(context, 340),
                  backgorundColor: kTextFieldAndButtomColor,
                  textColor: Colors.white,
                  borderColor: kTextFieldAndButtomColor,
                  onTap: () async {
                    await AddToCart(widget.itemId, currentQuantity);
                    showSnackBar(context, "Added successfuly",
                        backgroundColor: Colors.green);
                  },
                  borderRadiusSize: getProportionalWidth(context, 50),
                ),
              ),
            ),
            SizedBox(
              height: getProportionalHeight(context, 70),
            ),
          ],
        ),
      ),
    );
  }
}
