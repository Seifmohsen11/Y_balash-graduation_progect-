import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView(
      {super.key,
      required this.itemId,
      required this.title,
      required this.description,
      required this.finalPrice,
      required this.image,
      required this.isFavorite,
      required this.originalPrice,
      required this.cafeName});
  final String itemId;
  final String title;
  final String cafeName;
  final String description;
  final String finalPrice;
  final String? originalPrice;
  final String image;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ItemDetailsViewBody(
      itemId: itemId,
      onRemove: (String id) {},
      title: title,
      description: description,
      finalPrice: finalPrice,
      image: image,
      isFavorite: isFavorite,
      originalPrice: originalPrice,
      cafeName: cafeName,
    );
  }
}
