import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_view_of_cafes.dart';
import 'package:y_balash/core/constants/constants.dart';

class RestaurantsAndCafesView extends StatefulWidget {
  const RestaurantsAndCafesView({super.key});

  @override
  State<RestaurantsAndCafesView> createState() =>
      _RestaurantsAndCafesViewState();
}

class _RestaurantsAndCafesViewState extends State<RestaurantsAndCafesView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackArrow(),
          Expanded(
            child: ListViewOfCafes(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          )
        ],
      ),
    );
  }
}
