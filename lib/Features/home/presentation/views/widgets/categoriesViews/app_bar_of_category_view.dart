import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:y_balash/Features/home/presentation/views/cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';

class AppBarOfCategoryView extends StatelessWidget {
  const AppBarOfCategoryView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * (8 / 430)),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/arrow.svg'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * (10 / 430),
                  right: screenWidth * (10 / 430)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: screenWidth * (36 / 430),
                        fontFamily: kAbyssinicaSIL,
                        color: kTextFieldAndButtomColor),
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
            )
          ],
        ),
      ),
    );
  }
}
