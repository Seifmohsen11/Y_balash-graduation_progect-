import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';
import 'package:y_balash/core/data/services/home/get_items_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';

class ListOfTodaysOffers extends StatefulWidget {
  const ListOfTodaysOffers({super.key, this.limit});
  final int? limit;

  @override
  ListOfTodaysOffersState createState() => ListOfTodaysOffersState();
}

class ListOfTodaysOffersState extends State<ListOfTodaysOffers> {
  List<dynamic> products = [];
  bool isLoading = true;

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
        List<dynamic> mappedProducts = items.map((item) {
          final isFav = favoriteIds.contains(item['_id']);
          return {
            ...item,
            'isFavorite': isFav,
          };
        }).toList();

        // ✅ تطبيق limit لو موجود
        if (widget.limit != null && widget.limit! < mappedProducts.length) {
          mappedProducts = mappedProducts.sublist(0, widget.limit!);
        }

        setState(() {
          products = mappedProducts;
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

    if (isLoading) {
      return Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 24.h,
        ),
      );
    }

    if (products.isEmpty) {
      return const Center(child: Text("No products available"));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return Padding(
          padding: EdgeInsets.only(right: screenWidth * (16 / 430)),
          child: ProductCard(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            image: product['imageUrl'] ?? '',
            title: product['name'] ?? 'No Name',
            cafeName: product['restaurant']['name'] ?? 'UnKnown',
            finalPrice: product['discountedPrice']?.toString() ?? '0.00',
            id: product["_id"] ?? '0.00',
            isFavorite: product['isFavorite'] ?? false,
            originalPrice: product['originalPrice']?.toString(),
          ),
        );
      },
    );
  }
}
