import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/app_bar_of_category_view.dart';
import 'package:y_balash/core/constants/constants.dart';

class DairyView extends StatelessWidget {
  const DairyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          AppBarOfCategoryView(
            title: 'Dairy',
          )
        ],
      ),
    );
  }
}
