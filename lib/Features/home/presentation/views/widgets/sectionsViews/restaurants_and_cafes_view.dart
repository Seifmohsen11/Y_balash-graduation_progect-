import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/searchWidgets/search_bar_for_cafes_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_view_of_cafes.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

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

    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                children: [
                  const BackArrow(),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
                    child: const SearchBarForCafes(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListViewOfCafes(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
