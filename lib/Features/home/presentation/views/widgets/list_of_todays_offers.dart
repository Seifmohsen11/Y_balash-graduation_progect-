import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/product_card.dart';
import 'package:y_balash/core/data/services/home/get_items_service.dart';

class ListOfTodaysOffers extends StatefulWidget {
  const ListOfTodaysOffers({super.key});

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (products.isEmpty) {
      return const Center(child: Text("No products available"));
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
          id: product["_id"] ?? '0.00',
        );
      },
    );
  }
}
