import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/view_items_in_categories_service.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';

class DairyView extends StatefulWidget {
  const DairyView({super.key});

  @override
  State<DairyView> createState() => _DairyViewState();
}

class _DairyViewState extends State<DairyView> {
  final ProductService productService = ProductService();
  List<dynamic> products = [];
  bool isLoading = true;
  bool hasError = false;

  final String categoryId = "6790c4ef7b560c31cdb96905";

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final data = await productService.fetchProducts(categoryId);
      if (mounted) {
        setState(() {
          products = data;
          isLoading = false;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
      print('Failed to fetch products: $error');
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
            const AppBarOfCategoryView(title: 'Dairy'),
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
