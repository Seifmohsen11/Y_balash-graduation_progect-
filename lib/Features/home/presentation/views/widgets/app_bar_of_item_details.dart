import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfItemDetails extends StatelessWidget {
  const AppBarOfItemDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * (8 / 430)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * (10 / 430),
                right: screenWidth * (10 / 430)),
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/Arrow.png'),
                    ),
                  ),
                  IconButton(
                      iconSize: 28,
                      color: kTextFieldAndButtomColor,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const CartView();
                        }));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
