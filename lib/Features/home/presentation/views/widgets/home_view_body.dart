import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/Location_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cart_icon.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/green-circle_in_home.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/items_of_category.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/list_of_todays_offers.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/search_bar.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/tittle_of_section_and_see_all.dart';
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
              const Location(),
            ],
          ),
          Positioned(
            top: screenHeight * (168 / 932),
            left: screenWidth * (16 / 430),
            child: ItemOfCategory(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              image: "assets/images/Dairy.png",
              title: 'Dairy',
              onTap: () {},
            ),
          ),
          Positioned(
            top: screenHeight * (211 / 932),
            left: screenWidth * (126 / 430),
            child: ItemOfCategory(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              image: 'assets/images/bakery.png',
              title: 'Bakery',
              onTap: () {},
            ),
          ),
          Positioned(
            top: screenHeight * (211 / 932),
            left: screenWidth * (245 / 430),
            child: ItemOfCategory(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              image: 'assets/images/desert.png',
              title: 'Dessert',
              onTap: () {},
            ),
          ),
          Positioned(
            top: screenHeight * (166 / 932),
            left: screenWidth * (346 / 430),
            child: ItemOfCategory(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              image: 'assets/images/beverages.png',
              title: 'Beverages',
              onTap: () {},
            ),
          ),
          Positioned(
              top: screenHeight * (305 / 932),
              left: screenWidth * (15 / 430),
              child: TitleOfSectionAndSeeAll(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                label: "Today's Offers",
                onTap: () {},
              )),
          Positioned(
            top: screenHeight * (340 / 932),
            left: screenWidth * (5 / 430),
            right: screenWidth * (28 / 430),
            child: SizedBox(
              height: screenHeight * (243 / 932), // Adjust height as needed
              child: const ListOfTodaysOffers(),
            ),
          )
        ],
      ),
    );
  }
}
