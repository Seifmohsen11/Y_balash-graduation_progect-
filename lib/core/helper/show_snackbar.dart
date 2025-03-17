import 'package:flutter/material.dart';

double getProportionalWidth(BuildContext context, double originalWidth) {
  return (originalWidth / 430) * MediaQuery.of(context).size.width;
}

void showSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.red, IconData icon = Icons.error}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: getProportionalWidth(context, 24),
          ),
          SizedBox(
            width: getProportionalWidth(context, 10),
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: getProportionalWidth(context, 14),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating, // Makes it float above the UI
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          getProportionalWidth(context, 12),
        ), // Rounded corners
      ),
      duration: const Duration(seconds: 3), // Display duration
      margin: EdgeInsets.all(
        getProportionalWidth(context, 16),
      ), // Margin from screen edges
      elevation: 6, // Light shadow effect
    ),
  );
}
