import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cart_icon.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/green-circle_in_home.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/search_bar.dart';
import 'package:y_balash/core/constants/constants.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          GreenCircleInHome(
              screenHeight: screenHeight, screenWidth: screenWidth),
          Column(
            children: [
              SizedBox(
                height: screenHeight * (63 / 932),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (16 / 430)),
                child: Row(
                  children: [
                    CustomSearchBar(
                        screenWidth: screenWidth, screenHeight: screenHeight),
                    SizedBox(
                      width: screenWidth * (8 / 430),
                    ),
                    CartIcon(
                        screenHeight: screenHeight, screenWidth: screenWidth)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
