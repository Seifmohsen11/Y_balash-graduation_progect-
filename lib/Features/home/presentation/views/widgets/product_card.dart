import 'package:flutter/material.dart';
import 'package:y_balash/core/constants/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * (15 / 430)),
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
            borderRadius: BorderRadius.circular(screenWidth * (18 / 430))),
        height: screenHeight * (243 / 932),
        width: screenWidth * (175 / 430),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * (131 / 932),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * (16 / 932),
                    left: screenWidth * (35 / 430),
                    right: screenWidth * (40 / 430),
                    child: SizedBox(
                        height: screenHeight * (100 / 932),
                        width: screenWidth * (100 / 430),
                        child: Image.network(image)),
                  ),
                  Positioned(
                    top: screenHeight * (3 / 932),
                    right: screenWidth * (2 / 430),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * (8 / 430)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: kAbyssinicaSIL,
                        fontSize: screenWidth * (16 / 430)),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: kmainTextColor,
                        fontFamily: kAbyssinicaSIL,
                        fontSize: screenWidth * (12 / 430)),
                  ),
                  SizedBox(
                    height: screenWidth * (22 / 430),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * (12 / 430)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$$price',
                          style: TextStyle(
                              fontFamily: kAbyssinicaSIL,
                              fontSize: screenWidth * (18 / 430)),
                        ),
                        Container(
                          height: screenHeight * (40 / 932),
                          width: screenWidth * (40 / 430),
                          decoration: BoxDecoration(
                              color: kTextFieldAndButtomColor,
                              borderRadius: BorderRadius.circular(
                                  screenWidth * (16 / 430))),
                          child: Center(
                            child: IconButton(
                                onPressed: () {},
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
