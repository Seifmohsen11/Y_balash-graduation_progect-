import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/restaurantAndCafesWidgets/cafe_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/search_for_cafes_service.dart';

class SearchBarForCafes extends StatefulWidget {
  const SearchBarForCafes({
    super.key,
  });

  @override
  State<SearchBarForCafes> createState() => _SearchBarForCafesState();
}

class _SearchBarForCafesState extends State<SearchBarForCafes> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 53.h,
      child: TypeAheadField<Map<String, dynamic>>(
        suggestionsCallback: (String pattern) async {
          if (pattern.length < 2) return [];
          return await searchCafesByName(pattern);
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
                          suggestion['description'] ?? '',
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
          FocusScope.of(context).unfocus();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CafeView(
              cafeId: suggestion['_id'] ?? '',
            );
          }));
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
                fontSize: 20.sp,
                fontFamily: kInriaSansFont,
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 24.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.w),
              ),
              filled: true,
              fillColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
            ),
          );
        },
      ),
    );
  }
}
