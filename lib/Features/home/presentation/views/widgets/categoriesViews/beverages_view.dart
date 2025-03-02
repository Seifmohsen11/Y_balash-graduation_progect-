import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/view_items_in_categories_service.dart';

class BeveragesView extends StatefulWidget {
  const BeveragesView({super.key});

  @override
  State<BeveragesView> createState() => _BeveragesViewState();
}

class _BeveragesViewState extends State<BeveragesView> {
  final ProductService productService = ProductService();
  List<dynamic> products = [];
  bool isLoading = true;
  bool hasError = false;

  final String categoryId = "6790c799a732af882708e444";

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final data = await productService.fetchProducts(categoryId);
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print('Failed to fetch products: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          const AppBarOfCategoryView(title: 'Beverages'),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
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
    );
  }
}
