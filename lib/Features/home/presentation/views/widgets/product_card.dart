import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_cart_service.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';

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
    return Padding(
      padding: EdgeInsets.only(right: widget.screenWidth * (15 / 430)),
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
            borderRadius:
                BorderRadius.circular(widget.screenWidth * (18 / 430))),
        height: widget.screenHeight * (243 / 932),
        width: widget.screenWidth * (175 / 430),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: widget.screenHeight * (131 / 932),
              child: Stack(
                children: [
                  Positioned(
                    top: widget.screenHeight * (16 / 932),
                    left: widget.screenWidth * (35 / 430),
                    right: widget.screenWidth * (40 / 430),
                    child: SizedBox(
                        height: widget.screenHeight * (100 / 932),
                        width: widget.screenWidth * (100 / 430),
                        child: Image.network(widget.image)),
                  ),
                  Positioned(
                    top: widget.screenHeight * (3 / 932),
                    right: widget.screenWidth * (2 / 430),
                    child: IconButton(
                      onPressed: () async {
                        setState(() {
                          isRed = !isRed;
                        });

                        if (isRed) {
                          await AddToFavourite(widget.id);
                        } else {
                          await removeFromFavourite(widget.id);
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
            Padding(
              padding: EdgeInsets.only(left: widget.screenWidth * (8 / 430)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: kAbyssinicaSIL,
                        fontSize: widget.screenWidth * (16 / 430)),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                        color: kmainTextColor,
                        fontFamily: kAbyssinicaSIL,
                        fontSize: widget.screenWidth * (12 / 430)),
                  ),
                  SizedBox(
                    height: widget.screenWidth * (22 / 430),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: widget.screenWidth * (12 / 430)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.price}',
                          style: TextStyle(
                              fontFamily: kAbyssinicaSIL,
                              fontSize: widget.screenWidth * (18 / 430)),
                        ),
                        Container(
                          height: widget.screenHeight * (40 / 932),
                          width: widget.screenWidth * (40 / 430),
                          decoration: BoxDecoration(
                              color: kTextFieldAndButtomColor,
                              borderRadius: BorderRadius.circular(
                                  widget.screenWidth * (16 / 430))),
                          child: Center(
                            child: IconButton(
                                onPressed: () async {
                                  await AddToCart(widget.id, 1);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
