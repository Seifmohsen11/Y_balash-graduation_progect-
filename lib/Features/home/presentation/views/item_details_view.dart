import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/item_details_view_body.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemDetailsViewBody(
      itemId: '',
      onRemove: (String) {},
    );
  }
}
