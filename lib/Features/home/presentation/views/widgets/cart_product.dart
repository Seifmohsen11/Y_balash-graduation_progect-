import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/remove_from_cart.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.titel,
    required this.price,
    required this.itemId,
    required this.onRemove,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;
  final String titel;
  final String price;
  final String itemId;
  final VoidCallback onRemove; // Callback function

  @override
  Widget build(BuildContext context) {
    String formattedTitle = titel; // Default to original title

    int maxChars = 18; // Maximum characters before inserting a new line

// Format title
    if (titel.length > maxChars) {
      int breakPoint = titel.lastIndexOf(
          ' ', maxChars); // Find the last space before maxChars
      if (breakPoint == -1) {
        breakPoint = maxChars; // If no space is found, break at maxChars
      }
      formattedTitle =
          '${titel.substring(0, breakPoint)}\n${titel.substring(breakPoint).trim()}';
    }
    return Container(
      height: screenHeight * (104 / 932),
      width: screenWidth * (398 / 430),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * (16 / 430))),
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * (13 / 430)),
        child: Row(
          children: [
            Container(
              height: screenHeight * (71 / 932),
              width: screenWidth * (71 / 430),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(screenWidth * (8 / 430))),
              child: Image.network(image),
            ),
            SizedBox(
              width: screenWidth * (16 / 430),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * (12 / 932),
                ),
                SizedBox(
                  height: screenHeight * (50 / 932),
                  width: screenWidth * (159 / 430),
                  child: Text(
                    formattedTitle,
                    style: TextStyle(
                        fontFamily: kAbyssinicaSIL,
                        fontSize: screenWidth * (16 / 430),
                        color: kTextFieldAndButtomColor),
                  ),
                ),
                SizedBox(
                  height: screenHeight * (1 / 430),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontFamily: kAbyssinicaSIL,
                    fontSize: screenWidth * (18 / 430),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * (12 / 932)),
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth * (46 / 430)),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.favorite_border),
                      ),
                      SizedBox(width: screenWidth * (16 / 430)),
                      GestureDetector(
                        onTap: () async {
                          bool success = await removeFromCart(
                              itemId); // Wait for API response
                          if (success) {
                            onRemove(); // Update UI only if API call succeeds
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
                SizedBox(height: screenHeight * (6 / 932)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(width: screenWidth * (26 / 430)),
                      IconButton(
                          iconSize: screenWidth * (32 / 430),
                          onPressed: () {},
                          icon: Icon(Icons.remove_circle_outline)),
                      Text('1'),
                      IconButton(
                          iconSize: screenWidth * (32 / 430),
                          color: Colors.yellow,
                          onPressed: () {},
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
