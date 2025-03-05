import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/todays_offer_card.dart';
import 'package:y_balash/core/constants/constants.dart';

class TodaysOffersView extends StatelessWidget {
  const TodaysOffersView({super.key});

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
            child: GridViewOfTodaysOffers(
                screenWidth: screenWidth, screenHeight: screenHeight),
          )
        ],
      ),
    );
  }
}

class GridViewOfTodaysOffers extends StatelessWidget {
  const GridViewOfTodaysOffers({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * (8 / 430)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 191 / 392,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return TodaysOfferCard(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            firstColor: firistColors[index % firistColors.length],
            secondColor: secondColors[index % secondColors.length],
            icon: icons[index % icons.length],
          );
        },
      ),
    );
  }
}

List<Color> firistColors = [
  Color(0xFFFADAC5),
  Color(0xffF5C8E5),
  Color(0xffC1DCF8),
  Color(0xffEDC8F7),
];
List<Color> secondColors = [
  Color(0xFF912A12),
  Color(0xff560034),
  Color(0xff063769),
  Color(0xff581665),
];
List<AssetImage> icons = [
  AssetImage('assets/icons/discount.png'),
  AssetImage('assets/icons/sale.png'),
  AssetImage('assets/icons/first.png'),
  AssetImage('assets/icons/mick.png'),
];
