import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/cart_product.dart';
import 'package:y_balash/core/data/services/home/get_cart_product_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';

class ListOfCartProducts extends StatefulWidget {
  const ListOfCartProducts({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onCartUpdated,
    required this.onProductsFetched,
  });

  final double screenHeight;
  final double screenWidth;
  final VoidCallback onCartUpdated;
  final Function(List<dynamic>) onProductsFetched;

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
      final items = await getCartProduct();
      final favoriteIds = await getFavoriteIds();
      final updatedProducts = items.map((product) {
        final isFav = favoriteIds.contains(product['itemId']['_id']);
        return {
          ...product,
          'isFavorite': isFav,
        };
      }).toList();
      if (mounted) {
        setState(() {
          products = updatedProducts;
          isLoading = false;
        });
        widget.onProductsFetched(products);
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

  void removeProductFromList() async {
    await fetchProducts();
    widget.onCartUpdated();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
          height: widget.screenHeight * 0.3,
          child: Center(
            child: SpinKitThreeBounce(
              color: Colors.blue,
              size: 28.h,
            ),
          ));
    }

    if (products.isEmpty) {
      return SizedBox(
          height: widget.screenHeight * 0.3,
          child: const Center(child: Text("No products available")));
    }
    return SizedBox(
      height: widget.screenHeight * (460 / 932),
      child: Padding(
        padding: EdgeInsets.only(top: widget.screenHeight * (24 / 932)),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index]['itemId'];
            final isFavorite = products[index]['isFavorite'] ?? false;

            return Padding(
              padding: EdgeInsets.only(bottom: widget.screenHeight * (8 / 932)),
              child: CartProduct(
                screenHeight: widget.screenHeight,
                screenWidth: widget.screenWidth,
                image: product['imageUrl'] ?? '',
                titel: product['name'] ?? 'Unknown',
                price: product['price'] ?? 'Unknown',
                itemId: product['_id'] ?? 'Unknown',
                quantity: products[index]['quantity'],
                onRemove: () {
                  removeProductFromList();
                },
                initialIsFavorite: isFavorite,
              ),
            );
          },
        ),
      ),
    );
  }
}
