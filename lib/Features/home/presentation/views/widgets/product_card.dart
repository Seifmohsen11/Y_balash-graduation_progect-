import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/item_details_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_cart_service.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/get_item_details_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.id,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String description;
  final String price;
  final String id;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isRed = false;

  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  Future<void> checkIfFavorite() async {
    bool isFav = await isProductFavorite(widget.id);
    if (!mounted)
      return; // Ensure the widget is still in the widget tree before calling setState()
    setState(() {
      isRed = isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = widget.screenWidth * (175 / 430);
    double cardHeight = widget.screenHeight * (243 / 932);
    return Padding(
      padding: EdgeInsets.only(right: widget.screenWidth * (15 / 430)),
      child: GestureDetector(
        onTap: () async {
          final productData = await FetchItemDetails(widget.id);
          if (productData != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ItemDetailsView(
                itemId: widget.id,
                title: productData['name'],
                description: 'Quantity: ${productData['quantity']}',
                price: productData['price'].toString(),
                image: productData['imageUrl'],
              );
            }));
          }
        },
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 2,
                  offset: const Offset(1, 1),
                ),
              ],
              color: kPrimaryColor,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(18)),
          height: cardHeight,
          width: cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: cardHeight * 0.05,
                          left: cardWidth * 0.05,
                          right: cardWidth * 0.15,
                        ),
                        child: SizedBox(
                          height: cardHeight / 3,
                          width: cardWidth / 2,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.network(widget.image),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: cardHeight * .01,
                      right: cardWidth * .02,
                      child: IconButton(
                        onPressed: () async {
                          setState(() {
                            isRed = !isRed;
                          });

                          if (isRed) {
                            await AddToFavourite(widget.id);
                            showSnackBar(context, "Added successfuly",
                                backgroundColor: Colors.green);
                          } else {
                            await removeFromFavourite(widget.id);
                            showSnackBar(context, "Removed successfuly",
                                backgroundColor: Colors.green);
                          }
                        },
                        icon: Icon(
                          isRed ? Icons.favorite : Icons.favorite_outline,
                          color: isRed ? Colors.red : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: cardWidth * (8 / 175)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: kAbyssinicaSIL,
                            fontSize: cardWidth * (16 / 175)),
                      ),
                      Text(
                        widget.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: kmainTextColor,
                            fontFamily: kAbyssinicaSIL,
                            fontSize: cardWidth * (12 / 175)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: cardWidth * (12 / 175)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.price,
                              style: TextStyle(
                                  fontFamily: kAbyssinicaSIL,
                                  fontSize: cardWidth * (18 / 175)),
                            ),
                            Container(
                              height: cardWidth * (40 / 175),
                              width: cardWidth * (40 / 175),
                              decoration: BoxDecoration(
                                  color: kTextFieldAndButtomColor,
                                  borderRadius: BorderRadius.circular(
                                      cardWidth * (16 / 175))),
                              child: IconButton(
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                                iconSize: cardWidth * 0.15,
                                padding: EdgeInsets
                                    .zero, // عشان تلغي البادينج الداخلي
                                constraints:
                                    const BoxConstraints(), // تمنع القيود الافتراضية
                                onPressed: () async {
                                  await AddToCart(widget.id, 1);
                                  showSnackBar(context, "Added successfully",
                                      backgroundColor: Colors.green);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: cardHeight * 0.02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
