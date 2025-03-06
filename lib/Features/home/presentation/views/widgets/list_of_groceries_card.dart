import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/bakery_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/beverages_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/dairy_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/categoriesViews/dessert_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/groceries_card.dart';
import 'package:y_balash/core/data/services/home/get_categories_service.dart';

class ListOfGroceriesCard extends StatefulWidget {
  const ListOfGroceriesCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.scrollDirection,
    this.padding = const EdgeInsets.only(right: 15),
  });

  final double screenHeight;
  final double screenWidth;
  final Axis scrollDirection;
  final EdgeInsetsGeometry padding;

  @override
  State<ListOfGroceriesCard> createState() => _ListOfGroceriesCardState();
}

class _ListOfGroceriesCardState extends State<ListOfGroceriesCard> {
  List<dynamic> categories = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final data = await getCategories();
      setState(() {
        categories = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching categories: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : hasError
            ? const Center(child: Text('Failed to load categories'))
            : ListView.builder(
                scrollDirection: widget.scrollDirection,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  return Padding(
                    padding: widget.padding,
                    child: GestureDetector(
                      onTap: () {
                        if (category['_id'] == "6790c4ef7b560c31cdb96905") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DairyView();
                          }));
                        } else if (category['_id'] ==
                            "6790c50f7b560c31cdb96907") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BakeryView();
                          }));
                        } else if (category['_id'] ==
                            "6790c5287b560c31cdb96909") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const DessertView();
                          }));
                        } else if (category['_id'] ==
                            "6790c799a732af882708e444") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const BeveragesView();
                          }));
                        }
                        ;
                      },
                      child: GroceriesCard(
                        screenHeight: widget.screenHeight,
                        screenWidth: widget.screenWidth,
                        color: colors[index % colors.length], // Cycle colors
                        image: category['imageUrl'] ?? '',
                        label: category['name'] ?? '',
                      ),
                    ),
                  );
                },
              );
  }
}

List<Color> colors = [
  const Color(0xFFF5E3D0),
  const Color(0xFFC2E3CE),
];
