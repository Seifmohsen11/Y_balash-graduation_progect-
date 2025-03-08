import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/list_of_cart_product.dart';
import 'package:y_balash/core/constants/constants.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * (42 / 932),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const ImageIcon(
                  AssetImage('assets/icons/Arrow.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * (10 / 430),
                    right: screenWidth * (10 / 430)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart',
                      style: TextStyle(
                          fontSize: screenWidth * (36 / 430),
                          fontFamily: kAbyssinicaSIL,
                          color: kTextFieldAndButtomColor),
                    ),
                  ],
                ),
              ),
              ListOfCartProducts(
                  screenHeight: screenHeight, screenWidth: screenWidth)
            ],
          ),
        ));
  }
}
