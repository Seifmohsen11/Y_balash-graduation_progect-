import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/grid_view_of_todays_offers.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_todays_offers_service.dart';

class TodaysOffersView extends StatefulWidget {
  const TodaysOffersView({super.key});

  @override
  State<TodaysOffersView> createState() => _TodaysOffersViewState();
}

class _TodaysOffersViewState extends State<TodaysOffersView> {
  List<dynamic> products = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchTodaysOffers();
  }

  Future<void> fetchTodaysOffers() async {
    try {
      final items = await getTodaysOffers();
      setState(() {
        products = items;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching todays offers: $e');
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

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
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : hasError
                    ? const Center(child: Text('Failed to load offers'))
                    : GridViewOfTodaysOffers(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        products: products,
                      ),
          )
        ],
      ),
    );
  }
}
