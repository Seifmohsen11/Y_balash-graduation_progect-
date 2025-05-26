import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView(
      {super.key,
      required this.itemId,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.isFavorite});
  final String itemId;
  final String title;
  final String description;
  final String price;
  final String image;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ItemDetailsViewBody(
      itemId: itemId,
      onRemove: (String id) {},
      title: title,
      description: description,
      price: price,
      image: image,
      isFavorite: isFavorite,
    );
  }
}
