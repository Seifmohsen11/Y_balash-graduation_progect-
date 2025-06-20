import 'package:flutter/material.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
  static String id = 'locationView';
  @override
  Widget build(BuildContext context) {
    final double totalPrice =
        ModalRoute.of(context)!.settings.arguments as double;
    return LocationViewBody(totalPrice: totalPrice);
  }
}
