import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/cafe_card.dart';
import 'package:y_balash/core/data/services/home/get_restaurants_service.dart';

class ListViewOfCafes extends StatefulWidget {
  const ListViewOfCafes({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<ListViewOfCafes> createState() => _ListViewOfCafesState();
}

class _ListViewOfCafesState extends State<ListViewOfCafes> {
  List<dynamic> cafes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCafes();
  }

  Future<void> fetchCafes() async {
    try {
      final data = await getRestaurants();
      setState(() {
        cafes = data;
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching cafes: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 28.h,
        ),
      );
    }
    if (cafes.isEmpty) {
      return const Center(child: Text("No cafes available"));
    }
    return Padding(
      padding: EdgeInsets.only(
          left: widget.screenWidth * (16 / 430),
          right: widget.screenWidth * (16 / 430),
          top: widget.screenHeight * (24 / 932)),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: cafes.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final cafe = cafes[index];
          return CafesCard(
            screenWidth: widget.screenWidth,
            screenHeight: widget.screenHeight,
            imageUrl: cafe['imageUrl'] ?? '',
            name: cafe['name'] ?? 'Unknown Cafe',
            color: colors[index % colors.length],
          );
        },
      ),
    );
  }
}

List<Color> colors = [
  Color(0xFFE0DACD),
  Color(0xffD2D6D5),
];
