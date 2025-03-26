import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/list_of_favorites_product.dart';
import 'package:y_balash/core/constants/constants.dart';

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
              AppBarOfCartView(
                screenWidth: screenWidth,
                iconImage: 'assets/icons/Arrow.png',
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
        ));
  }
}

class AppBarOfCartView extends StatelessWidget {
  const AppBarOfCartView({
    super.key,
    required this.screenWidth,
    required this.iconImage,
    required this.title,
    required this.onPressed,
  });

  final double screenWidth;
  final String iconImage;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: ImageIcon(
            AssetImage(iconImage),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * (10 / 430), right: screenWidth * (10 / 430)),
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
            ],
          ),
        ),
      ],
    );
  }
}
