import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurantAndCafesWidgets/app_bar_of_cafe_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_restaurant_by_id_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class CafeView extends StatefulWidget {
  const CafeView({super.key, required this.cafeId});
  final String cafeId;
  @override
  State<CafeView> createState() => _CafeViewState();
}

class _CafeViewState extends State<CafeView> {
  List<dynamic> products = [];
  String cafeName = '';
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final restaurant =
          await getRestaurantsById(widget.cafeId); // Call the service
      final List<dynamic> items = restaurant['images'] ?? []; // المنتجات
      final favoriteIds = await getFavoriteIds();
      if (mounted) {
        setState(() {
          cafeName = restaurant['name'] ?? 'Unknown Cafe'; // اسم الكافيه
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
          hasError = true;
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
            AppBarOfCafeView(title: cafeName),
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
                      : (products.isEmpty)
                          ? const Center(child: Text('No products available'))
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
