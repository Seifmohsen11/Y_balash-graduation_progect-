import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/item_details_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_item_details_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';

class FavouriteProductCard extends StatefulWidget {
  const FavouriteProductCard({
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
  final Function(String) onRemove;
  @override
  State<FavouriteProductCard> createState() => _FavouriteProductCardState();
}

class _FavouriteProductCardState extends State<FavouriteProductCard> {
  bool isRed = true;
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
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();

        final productData = await FetchItemDetails(widget.itemId);

        if (productData != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ItemDetailsView(
              itemId: widget.itemId,
              title: productData['name'],
              description: 'Quantity: ${productData['quantity']}',
              finalPrice: productData['discountedPrice'].toString(),
              image: productData['imageUrl'],
              isFavorite: true,
              originalPrice: productData['originalPrice'].toString(),
              cafeName: productData['restaurant']['name'] ?? 'Unknown',
              description2: productData['description'] ?? '',
            );
          }));
        }
      },
      child: Container(
        height: widget.screenHeight * (104 / 932),
        width: widget.screenWidth * (398 / 430),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(widget.screenWidth * (16 / 430))),
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
                    '${widget.price} EGP',
                    style: TextStyle(
                      color: kTextFieldAndButtomColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: kAbyssinicaSIL,
                      fontSize: widget.screenWidth * (18 / 430),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: widget.screenHeight * (2 / 932)),
                    child: Row(
                      children: [
                        SizedBox(width: widget.screenWidth * (80 / 430)),
                        IconButton(
                          onPressed: () async {
                            bool success =
                                await removeFromFavourite(widget.itemId);
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
