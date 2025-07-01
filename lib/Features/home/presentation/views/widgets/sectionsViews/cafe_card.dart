import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurantAndCafesWidgets/cafe_view.dart';

class CafesCard extends StatelessWidget {
  const CafesCard(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.imageUrl,
      required this.name,
      required this.color,
      required this.cafeId});
  final double screenWidth;
  final double screenHeight;
  final String imageUrl;
  final String name;
  final String cafeId;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * (16 / 932)),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CafeView(
              cafeId: cafeId,
            );
          }));
        },
        child: Container(
          height: screenHeight * (102 / 932),
          width: screenWidth * (372 / 430),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * (18 / 430)),
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: screenWidth * (16 / 430)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * (32 / 430)),
                  child: Image.network(
                    imageUrl,
                    height: 63.h,
                    width: 63.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: screenWidth * (20 / 430),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: screenWidth * (20 / 430)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
