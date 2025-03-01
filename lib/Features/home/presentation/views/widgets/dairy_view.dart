import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';

class DairyView extends StatelessWidget {
  const DairyView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppBarOfCategoryView(
            title: 'Dairy',
          ),
          GridViewOfProducts(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdLYLrpcL-2TKZDY0eljDthboDPMytCCRgVg&s',
            title: 'bottel of milk',
            description: '1000 ml',
            price: '4.99',
          ),
        ],
      ),
    );
  }
}
