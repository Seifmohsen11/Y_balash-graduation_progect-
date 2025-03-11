import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String message,
    {Color backgroundColor = Colors.red, IconData icon = Icons.error}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating, // Makes it float above the UI
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r), // Rounded corners
      ),
      duration: const Duration(seconds: 3), // Display duration
      margin: EdgeInsets.all(16.w), // Margin from screen edges
      elevation: 6, // Light shadow effect
    ),
  );
}
