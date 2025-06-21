import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_items_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
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
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final items = await getItems(); // Call the service
      final favoriteIds = await getFavoriteIds();
      if (mounted) {
        setState(() {
          products = items.map((item) {
            final isFav = favoriteIds.contains(item['_id']);
            return {
              ...item,
              'isFavorite': isFav,
            };
          }).toList();
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching products: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
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
            const AppBarOfCategoryView(title: "Today's Offers"),
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
