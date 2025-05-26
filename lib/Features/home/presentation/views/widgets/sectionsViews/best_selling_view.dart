import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_best_selling_service.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class BestSellingView extends StatefulWidget {
  const BestSellingView({super.key});

  @override
  State<BestSellingView> createState() => _BestSellingViewState();
}

class _BestSellingViewState extends State<BestSellingView> {
  List<dynamic> products = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchBestSelling();
  }

  Future<void> fetchBestSelling() async {
    try {
      final items = await getBestSelling();
      setState(() {
        products = items;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching best-selling products: $e');
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
          children: [
            const AppBarOfCategoryView(title: 'Best Selling'),
            Expanded(
              child: isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 28.h,
                      ),
                    )
                  : hasError
                      ? const Center(child: Text('Failed to load products'))
                      : GridViewOfProducts(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          products: products,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
