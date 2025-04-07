import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/favouriteWidgets/favourite_product_card.dart';
import 'package:y_balash/core/data/services/home/get_favourite_product_service.dart';

class ListOfFavoritesProducts extends StatefulWidget {
  const ListOfFavoritesProducts({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onFavoriteUpdated,
  });

  final double screenHeight;
  final double screenWidth;
  final VoidCallback onFavoriteUpdated;

  @override
  State<ListOfFavoritesProducts> createState() =>
      _ListOfFavoritesProductsState();
}

class _ListOfFavoritesProductsState extends State<ListOfFavoritesProducts> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final items = await getFavoriteProduct();

      if (mounted) {
        setState(() {
          products = items;
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

  void removeProductFromList(String itemId) {
    setState(() {
      products.removeWhere((product) => product['itemId']['_id'] == itemId);
    });
    widget.onFavoriteUpdated();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
          height: widget.screenHeight * 0.3,
          child: const Center(child: CircularProgressIndicator()));
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
            child: FavouriteProductCard(
              screenHeight: widget.screenHeight,
              screenWidth: widget.screenWidth,
              image: product['imageUrl'] ?? '',
              titel: product['name'] ?? 'Unknown',
              price: product['price'] ?? 'Unknown',
              itemId: product['_id'] ?? 'Unknown',
              onRemove: (String itemId) {
                removeProductFromList(itemId);
              },
            ),
          );
        },
      ),
    );
  }
}
