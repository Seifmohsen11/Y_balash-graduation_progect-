import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:y_balash/Features/home/presentation/views/item_details_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_item_details_service.dart';
import 'package:y_balash/core/data/services/home/search_service.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.isSearchScreen = false,
  });

  final double screenHeight;
  final double screenWidth;
  final bool isSearchScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * (345 / 430),
      height: screenHeight * (53 / 932),
      child: TypeAheadField<Map<String, dynamic>>(
        suggestionsCallback: (String pattern) async {
          if (pattern.length < 2) return [];
          return await searchProductsByName(pattern);
        },
        itemBuilder: (context, Map<String, dynamic> suggestion) {
          return Card(
            margin: EdgeInsets.symmetric(
              vertical: 6.h,
              horizontal: 8.w,
            ),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: suggestion['imageUrl'] != null
                        ? Image.network(
                            suggestion['imageUrl'],
                            width: 50.w,
                            height: 50.w,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.image, size: 50.w),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suggestion['name'] ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: kInriaSansFont,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          suggestion['price'] ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                            fontFamily: kInriaSansFont,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        onSelected: (Map<String, dynamic> suggestion) async {
          // هنا تقدر تعمل أي حاجة بعد اختيار suggestion
          print('Selected: ${suggestion['name']}');

          final productData = await FetchItemDetails(suggestion['_id'] ?? '');
          if (productData != null) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ItemDetailsView(
                itemId: suggestion['_id'] ?? '',
                title: productData['name'],
                description: 'Quantity: ${productData['quantity']}',
                price: productData['price'].toString(),
                image: productData['imageUrl'],
              );
            }));
          }
        },
        hideOnEmpty: true,
        controller: TextEditingController(),
        builder: (context, controller, focusNode) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: const Color(0xff8A8A8A),
                fontSize: screenWidth * (20 / 430),
                fontFamily: kInriaSansFont,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: screenWidth * (24 / 430),
              ),
              suffixIcon: isSearchScreen
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 22.h,
                          ),
                          onPressed: () => controller.clear(),
                        ),
                      ],
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: isSearchScreen
                    ? BorderRadius.circular(screenWidth * (16 / 430))
                    : BorderRadius.circular(screenWidth * (32 / 430)),
              ),
              filled: true,
              fillColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: screenHeight * (10 / 932),
              ),
            ),
          );
        },
      ),
    );
  }
}
