import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/item_details_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_to_cart_service.dart';
import 'package:y_balash/core/data/services/home/add_to_favourite_service.dart';
import 'package:y_balash/core/data/services/home/get_item_details_service.dart';
import 'package:y_balash/core/data/services/home/remove_from_favourite_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.finalPrice,
    required this.id,
    required this.isFavorite,
    this.originalPrice,
    required this.cafeName,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String cafeName;
  final String finalPrice;
  final String? originalPrice;
  final String id;
  final bool isFavorite;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isRed;

  @override
  void initState() {
    super.initState();
    isRed = widget.isFavorite;
  }

  String _formatPrice(String priceString) {
    try {
      double price = double.parse(priceString);
      if (price >= 10000) return '9999';
      return price % 1 == 0
          ? price.toStringAsFixed(0)
          : price.toStringAsFixed(2);
    } catch (e) {
      return '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = 175.w;
    double cardHeight = 243.h;
    return GestureDetector(
      onTap: () async {
        FocusScope.of(context).unfocus();
        final productData = await FetchItemDetails(widget.id);
        if (productData != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ItemDetailsView(
              itemId: widget.id,
              title: productData['name'],
              description: 'Quantity: ${productData['quantity']}',
              finalPrice: productData['discountedPrice'].toString(),
              image: productData['imageUrl'],
              isFavorite: widget.isFavorite,
              originalPrice: productData['originalPrice'].toString(),
              cafeName: productData['restaurant']['name'] ?? 'Unknown',
              description2: productData['description'] ?? '',
            );
          }));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
          color: kPrimaryColor,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(18.r),
        ),
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
                    top: cardHeight * 0.01,
                    right: cardWidth * 0.02,
                    child: IconButton(
                      onPressed: () async {
                        setState(() {
                          isRed = !isRed;
                        });

                        if (isRed) {
                          await addToFavourite(widget.id);
                          showSnackBar(context, "Added successfully",
                              backgroundColor: Colors.green);
                        } else {
                          await removeFromFavourite(widget.id);
                          showSnackBar(context, "Removed successfully",
                              backgroundColor: Colors.green);
                        }
                      },
                      icon: Icon(
                        size: 28.sp,
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
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: kAbyssinicaSIL,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      widget.cafeName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kmainTextColor,
                        fontFamily: kAbyssinicaSIL,
                        fontSize: 12.sp,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.originalPrice != null &&
                                  widget.originalPrice!.isNotEmpty)
                                Text(
                                  '${_formatPrice(widget.originalPrice!.replaceAll(RegExp(r'[^0-9.]'), ''))} EGP',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xffBDB092),
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: const Color(0xffBDB092),
                                  ),
                                ),
                              Text(
                                '${_formatPrice(widget.finalPrice)} EGP',
                                style: TextStyle(
                                  color: kTextFieldAndButtomColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: kAbyssinicaSIL,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 43.h,
                            width: 43.h,
                            decoration: BoxDecoration(
                              color: kTextFieldAndButtomColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              iconSize: 20.sp,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () async {
                                await AddToCart(widget.id, 1);
                                showSnackBar(context, "Added successfully",
                                    backgroundColor: Colors.green);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
