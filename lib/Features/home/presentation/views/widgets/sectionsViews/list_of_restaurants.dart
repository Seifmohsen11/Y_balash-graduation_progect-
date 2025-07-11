import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurantAndCafesWidgets/cafe_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurantAndCafesWidgets/restaurants_card.dart';
import 'package:y_balash/core/data/services/home/get_restaurants_service.dart';

class ListOfRestaurants extends StatefulWidget {
  const ListOfRestaurants({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  ListOfRestaurantsState createState() => ListOfRestaurantsState();
}

class ListOfRestaurantsState extends State<ListOfRestaurants> {
  List<dynamic> restaurants = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    try {
      final data = await getRestaurants(); // Call the service
      if (mounted) {
        setState(() {
          restaurants = data; // Store API response
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching restaurants: $error');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 24.h,
        ),
      );
    }

    if (restaurants.isEmpty) {
      return const Center(child: Text("No restaurants available"));
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: restaurants.length,
      itemBuilder: (BuildContext context, int index) {
        final restaurant = restaurants[index];

        return RestaurantsCard(
          screenHeight: widget.screenHeight,
          screenWidth: widget.screenWidth,
          image:
              restaurant['imageUrl'] ?? '', // Assuming API provides 'imageUrl'
          color: colors[index % colors.length],
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CafeView(
                cafeId: restaurant['_id'] ?? '',
              );
            }));
          }, // Cycle through colors
        );
      },
    );
  }
}

// Define colors for card backgrounds
List<Color> colors = [
  Color(0xff8A8A8A), // Grey
  Color(0xff003366), // Dark Blue
];
