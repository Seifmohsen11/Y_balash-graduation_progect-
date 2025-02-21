import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';
import 'package:y_balash/core/data/services/home/get_best_selling_service.dart';

class ListOfBestSelling extends StatefulWidget {
  const ListOfBestSelling({super.key});

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
      setState(() {
        products = items;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching best-selling products: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (products.isEmpty) {
      return const Center(child: Text("No best-selling products available"));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];

        return ProductCard(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
          image: product['imageUrl'] ?? '',
          title: product['name'] ?? 'No Name',
          description: product['quantity'] ?? 'No Quantity Info',
          price: product['price'] ?? '0.00',
        );
      },
    );
  }
}
