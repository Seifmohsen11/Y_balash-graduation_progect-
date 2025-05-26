import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_of_groceries_card.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class GroceriesView extends StatelessWidget {
  const GroceriesView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SwipeBackWrapper(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const BackArrow(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * (24 / 932)),
                child: ListOfGroceriesCard(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      left: screenWidth * (15 / 430),
                      right: screenWidth * (15 / 430),
                      bottom: screenHeight * (15 / 932)),
                ),
              ),
            )
          ])),
    );
  }
}
