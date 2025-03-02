import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/app_bar_of_category_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/grid_view_of_products.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/view_items_in_categories_service.dart'; // Ensure the correct import for ProductService

class DessertView extends StatefulWidget {
  const DessertView({super.key});

  @override
  State<DessertView> createState() => _DessertViewState();
}

class _DessertViewState extends State<DessertView> {
  final ProductService productService = ProductService();
  List<dynamic> products = [];
  bool isLoading = true;
  bool hasError = false;

  final String categoryId = "6790c5287b560c31cdb96909";

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
          const AppBarOfCategoryView(title: 'Desserts'),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : hasError
                    ? const Center(child: Text('Failed to load products'))
                    : GridViewOfProducts(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        products: products, // Pass fetched products list
                      ),
          ),
        ],
      ),
    );
  }
}
