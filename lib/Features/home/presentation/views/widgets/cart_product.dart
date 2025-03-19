import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_cart.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/data/services/home/update_cart_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.titel,
    required this.price,
    required this.itemId,
    required this.onRemove,
    required this.quantity,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;
  final String titel;
  final String price;
  final String itemId;
  final int quantity;
  final VoidCallback onRemove;
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  late int currentQuantity;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    currentQuantity = widget.quantity;
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    bool favoriteStatus = await isProductFavorite(widget.itemId);
    if (!mounted) return;
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  void updateQuantity(int newQuantity) async {
    if (newQuantity < 1) return;

    setState(() {
      currentQuantity = newQuantity;
    });

    try {
      await UpdateCart(widget.itemId, newQuantity);
      print("Quantity updated successfuly");
    } catch (error) {
      print("Faild to update quantity $error");
    }
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

  // Callback function
  @override
  Widget build(BuildContext context) {
    String formattedTitle = widget.titel; // Default to original title

    int maxChars = 18; // Maximum characters before inserting a new line

// Format title
    if (widget.titel.length > maxChars) {
      int breakPoint = widget.titel
          .lastIndexOf(' ', maxChars); // Find the last space before maxChars
      if (breakPoint == -1) {
        breakPoint = maxChars; // If no space is found, break at maxChars
      }
      formattedTitle =
          '${widget.titel.substring(0, breakPoint)}\n${widget.titel.substring(breakPoint).trim()}';
    }
    return Container(
      height: widget.screenHeight * (104 / 932),
      width: widget.screenWidth * (398 / 430),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.screenWidth * (16 / 430))),
      child: Padding(
        padding: EdgeInsets.only(left: widget.screenWidth * (13 / 430)),
        child: Row(
          children: [
            Container(
              height: widget.screenHeight * (71 / 932),
              width: widget.screenWidth * (71 / 430),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * (8 / 430))),
              child: Image.network(widget.image),
            ),
            SizedBox(
              width: widget.screenWidth * (16 / 430),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.screenHeight * (12 / 932),
                ),
                SizedBox(
                  height: widget.screenHeight * (50 / 932),
                  width: widget.screenWidth * (159 / 430),
                  child: Text(
                    formattedTitle,
                    style: TextStyle(
                        fontFamily: kAbyssinicaSIL,
                        fontSize: widget.screenWidth * (16 / 430),
                        color: kTextFieldAndButtomColor),
                  ),
                ),
                SizedBox(
                  height: widget.screenHeight * (1 / 430),
                ),
                Text(
                  '\$${widget.price}',
                  style: TextStyle(
                    fontFamily: kAbyssinicaSIL,
                    fontSize: widget.screenWidth * (18 / 430),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: widget.screenHeight * (12 / 932)),
                  child: Row(
                    children: [
                      SizedBox(width: widget.screenWidth * (46 / 430)),
                      GestureDetector(
                        onTap: () {
                          toggleFavorite();
                        },
                        child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black),
                      ),
                      SizedBox(width: widget.screenWidth * (16 / 430)),
                      GestureDetector(
                        onTap: () async {
                          bool success = await removeFromCart(
                              itemId: widget.itemId); // Wait for API response
                          if (success) {
                            showSnackBar(context, 'Removed Successfully',
                                backgroundColor: Colors.green);
                            widget
                                .onRemove(); // Update UI only if API call succeeds
                          } else {
                            print('Failed to remove item from cart');
                          }
                        },
                        child: const ImageIcon(
                            AssetImage('assets/icons/delete.png')),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.screenHeight * (6 / 932)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(width: widget.screenWidth * (14 / 430)),
                      IconButton(
                          iconSize: widget.screenWidth * (32 / 430),
                          onPressed: () {
                            updateQuantity(currentQuantity - 1);
                          },
                          icon: Icon(Icons.remove_circle_outline)),
                      Text("$currentQuantity"),
                      IconButton(
                          iconSize: widget.screenWidth * (32 / 430),
                          color: Colors.yellow,
                          onPressed: () {
                            updateQuantity(currentQuantity + 1);
                          },
                          icon: Icon(Icons.add_circle_outline)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
