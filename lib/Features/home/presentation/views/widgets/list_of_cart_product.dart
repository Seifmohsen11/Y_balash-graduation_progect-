import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cart_product.dart';
import 'package:y_balash/core/data/services/home/get_cart_product_service.dart';

class ListOfCartProducts extends StatefulWidget {
  const ListOfCartProducts({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<ListOfCartProducts> createState() => _ListOfCartProductsState();
}

class _ListOfCartProductsState extends State<ListOfCartProducts> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final items = await getCartProduct(); // Call the service
      setState(() {
        products = items; // Store the fetched data
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching products: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (products.isEmpty) {
      return SizedBox(
          height: widget.screenHeight * 0.3,
          child: const Center(child: Text("No products available")));
    }
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index]['itemId'];
          return Padding(
            padding: EdgeInsets.only(bottom: widget.screenHeight * (8 / 932)),
            child: CartProduct(
              screenHeight: widget.screenHeight,
              screenWidth: widget.screenWidth,
              image: product['imageUrl'] ?? '',
              titel: product['name'] ?? 'Unknown',
              price: product['price'] ?? 'Unknown',
            ),
          );
        },
      ),
    );
  }
}
