import 'package:flutter/material.dart';
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
  });

  final double screenHeight;
  final double screenWidth;

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
          return ListTile(
            leading: suggestion['imageUrl'] != null
                ? Image.network(
                    suggestion['imageUrl'],
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image),
            title: Text(
              suggestion['name'] ?? '',
              style: const TextStyle(fontFamily: kInriaSansFont),
            ),
            subtitle: Text(suggestion['price'] ?? ''),
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * (32 / 430)),
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
