import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_item_details.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
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
  bool isRed = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
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
                  onPressed: () async {
                    bool success = await removeFromFavourite(widget.itemId);
                    if (success) {
                      showSnackBar(context, 'Removed successfully',
                          backgroundColor: Colors.green);
                      widget.onRemove(widget.itemId);
                    } else {
                      print('Failed to remove item from favorites');
                    }
                  },
                  icon: Icon(
                    isRed ? Icons.favorite : Icons.favorite_outline,
                    color: isRed ? Colors.red : null,
                  ),
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
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline)),
                    Text("1"),
                    IconButton(
                        iconSize: getProportionalWidth(context, 32),
                        color: Colors.yellow,
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline)),
                  ],
                ),
                Text(
                  widget.price,
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
              onTap: () {})
        ],
      ),
    );
  }
}
