import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/todays_offer_card.dart';

class GridViewOfTodaysOffers extends StatelessWidget {
  const GridViewOfTodaysOffers({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.products,
  });

  final double screenWidth;
  final double screenHeight;
  final List<dynamic> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * (8 / 430)),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: 191 / 392,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.only(bottom: screenHeight * (10 / 932)),
            child: TodaysOfferCard(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              firstColor: firistColors[index % firistColors.length],
              secondColor: secondColors[index % secondColors.length],
              subjectColor: subjectColors[index % subjectColors.length],
              icon: icons[index % icons.length],
              title: product['title'],
              subject: product['subject'],
              description: product['description'],
              imageUrl: product['imageUrl'],
            ),
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
List<Color> subjectColors = [
  Color(0xffA63820),
  Color(0xff911224),
  Color(0xff15385E),
  Color(0xff5B2367),
];
List<AssetImage> icons = [
  AssetImage('assets/icons/discount.png'),
  AssetImage('assets/icons/sale.png'),
  AssetImage('assets/icons/first.png'),
  AssetImage('assets/icons/mick.png'),
];
