import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/Location_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/cart_icon.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/bakery_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/beverages_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/dairy_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/dessert_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/green-circle_in_home.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/items_of_category.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/list_of_gift_card.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_of_restaurants.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_of_best_selling.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_of_groceries_card.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/list_of_todays_offers.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/searchWidgets/search_bar.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/best_selling_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/groceries_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/restaurants_and_cafes_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/todays_offers_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/tittle_of_section_and_see_all.dart';
import 'package:y_balash/core/constants/constants.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  Future<void> refreshData() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * (305 / 932),
                child: Stack(
                  children: [
                    GreenCircleInHome(
                        screenHeight: screenHeight, screenWidth: screenWidth),
                    Column(
                      children: [
                        SizedBox(height: screenHeight * (63 / 932)),
                        Padding(
                          padding:
                              EdgeInsets.only(left: screenWidth * (16 / 430)),
                          child: Row(
                            children: [
                              CustomSearchBar(
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight),
                              SizedBox(width: screenWidth * (8 / 430)),
                              CartIcon(
                                  screenHeight: screenHeight,
                                  screenWidth: screenWidth)
                            ],
                          ),
                        ),
                        const Location(),
                      ],
                    ),
                    //****************Categories Section**************************
                    Positioned(
                      top: screenHeight * (168 / 932),
                      left: screenWidth * (16 / 430),
                      child: ItemOfCategory(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        image: "assets/images/Dairy.png",
                        title: 'Dairy',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DairyView();
                          }));
                        },
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
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BakeryView();
                          }));
                        },
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
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DessertView();
                          }));
                        },
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
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BeveragesView();
                          }));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //********************Section: Today's Offers***********************
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (15 / 430)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOfSectionAndSeeAll(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: "Today's Offers",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TodaysOffersView();
                        }));
                      },
                      spaceBetween: screenWidth * (165 / 430),
                    ),
                    SizedBox(height: screenHeight * (3 / 932)),
                    SizedBox(
                      height: screenHeight * (245 / 932),
                      child: const ListOfTodaysOffers(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * (16 / 932),
              ),
              //********************Section: Restaurants & Cafes*****************************
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * (16 / 430),
                    top: screenHeight * (6 / 930)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOfSectionAndSeeAll(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: "Restaurants & Cafes",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const RestaurantsAndCafesView();
                        }));
                      },
                      spaceBetween: screenWidth * (102 / 430),
                    ),
                    SizedBox(
                        height: screenHeight *
                            (3 / 932)), // Space for layout balance
                    SizedBox(
                      height: screenHeight * (273 / 932),
                      child: ListOfRestaurants(
                          screenHeight: screenHeight, screenWidth: screenWidth),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * (16 / 932),
              ),
              //**********************section of Best Selling**********************
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (15 / 430)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOfSectionAndSeeAll(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: "Best Selling",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const BestSellingView();
                        }));
                      },
                      spaceBetween: screenWidth * (193 / 430),
                    ),
                    SizedBox(height: screenHeight * (3 / 932)),
                    SizedBox(
                      height: screenHeight *
                          (245 / 932), // Keep ListView constrained
                      child: const ListOfBestSelling(),
                    ),
                  ],
                ),
              ),
              //********************section of Groceries************************
              SizedBox(
                height: screenHeight * (16 / 932),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (15 / 430)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleOfSectionAndSeeAll(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      label: "Groceries",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const GroceriesView();
                        }));
                      },
                      spaceBetween: screenWidth * (230 / 430),
                    ),
                    SizedBox(height: screenHeight * (3 / 932)),
                    SizedBox(
                        height: screenHeight *
                            (101 / 932), // Keep ListView constrained
                        child: ListOfGroceriesCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          scrollDirection: Axis.horizontal,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * (20 / 930),
              ),
              //********************section of Gift card************************
              Padding(
                padding: EdgeInsets.only(left: screenWidth * (15 / 430)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListOfGiftCards(
                          screenHeight: screenHeight, screenWidth: screenWidth),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: screenHeight * (45 / 930),
              )
            ],
          ),
        ),
      ),
    );
  }
}
