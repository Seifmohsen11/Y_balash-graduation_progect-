import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/favouriteWidgets/list_of_favorites_product.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class FavouriteViewBody extends StatefulWidget {
  const FavouriteViewBody({super.key});

  @override
  State<FavouriteViewBody> createState() => _FavouriteViewBodyState();
}

class _FavouriteViewBodyState extends State<FavouriteViewBody> {
  void refreshFavourite() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SwipeBackWrapper(
      onSwipeBack: () {
        Navigator.popAndPushNamed(context, MainView.id);
      },
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * (16 / 430)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * (42 / 932),
                ),
                AppBarOfCartView(
                  screenWidth: screenWidth,
                  iconImage: 'assets/icons/arrow.svg',
                  title: 'Favorites',
                  onPressed: () {
                    Navigator.popAndPushNamed(context, MainView.id);
                  },
                ),
                ListOfFavoritesProducts(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    onFavoriteUpdated: refreshFavourite)
              ],
            ),
          )),
    );
  }
}
