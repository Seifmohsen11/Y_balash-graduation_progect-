import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';
import 'package:y_balash/core/data/services/home/get_best_selling_service.dart';
import 'package:y_balash/core/helper/is_product_favorite.dart';

class ListOfBestSelling extends StatefulWidget {
  const ListOfBestSelling({super.key, this.limit});
  final int? limit;

  @override
  ListOfBestSellingState createState() => ListOfBestSellingState();
}

class ListOfBestSellingState extends State<ListOfBestSelling> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBestSelling();
  }

  Future<void> fetchBestSelling() async {
    try {
      final items = await getBestSelling(); // Fetch data from API
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
      print('Error fetching best-selling products: $error');
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
      return const Center(child: Text("No best-selling products available"));
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
            description: product['quantity'] ?? 'No Quantity Info',
            finalPrice: product['discountedPrice']?.toString() ?? '0.00',
            originalPrice: product['originalPrice']?.toString(),
            id: product['_id'] ?? '0.00',
            isFavorite: product['isFavorite'] ?? false,
          ),
        );
      },
    );
  }
}
