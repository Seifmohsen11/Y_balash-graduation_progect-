import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/grid_view_of_todays_offers.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_todays_offers_service.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

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
      if (!mounted) return;
      setState(() {
        products = items;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching todays offers: $e');
      if (!mounted) return;
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
    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackArrow(),
            SizedBox(
              height: screenHeight * (12 / 932),
            ),
            Expanded(
              child: isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 28.h,
                      ),
                    )
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
      ),
    );
  }
}
