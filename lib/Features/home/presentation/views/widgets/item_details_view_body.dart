import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_item_details.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_cart_service.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class ItemDetailsViewBody extends StatefulWidget {
  const ItemDetailsViewBody({
    super.key,
    required this.itemId,
    required this.onRemove,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
  final String itemId;
  final Function(String) onRemove;
  final String title;
  final String description;
  final String price;
  final String image;

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
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    bool favoriteStatus = await isProductFavorite(widget.itemId);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await removeFromFavourite(widget.itemId);
      showSnackBar(context, 'Removed Successfully',
          backgroundColor: Colors.green);
    } else {
      await AddToFavourite(widget.itemId);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppBarOfItemDetails(),
          SizedBox(
            height: getProportionalHeight(context, 56),
          ),
          Image.network(
            widget.image,
            height: getProportionalHeight(context, 280),
            width: getProportionalWidth(context, 315),
            fit: BoxFit.fill,
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
          SizedBox(
            height: getProportionalHeight(context, 27),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionalWidth(context, 36)),
            child: Row(
              children: [
                SizedBox(
                  width: getProportionalWidth(context, 303),
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        fontSize: getProportionalWidth(context, 20),
                        color: Color(0xff8A8A8A),
                        fontFamily: kLatoLight),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(context, 42),
          ),
          Padding(
            padding: EdgeInsets.only(right: getProportionalWidth(context, 32)),
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
                    Text("$currentQuantity"),
                    IconButton(
                        iconSize: getProportionalWidth(context, 32),
                        color: Colors.yellow,
                        onPressed: () {
                          updateQuantity(currentQuantity + 1);
                        },
                        icon: const Icon(Icons.add_circle_outline)),
                  ],
                ),
                Text(
                  "${(double.parse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) * currentQuantity).toStringAsFixed(2)} EGP",
                  style: TextStyle(
                      fontSize: getProportionalWidth(context, 24),
                      color: const Color(0xFF1C573E)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionalHeight(context, 77),
          ),
          CustomButtom(
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
          )
        ],
      ),
    );
  }
}
