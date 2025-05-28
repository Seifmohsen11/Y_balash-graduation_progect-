import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationLabelButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const LocationLabelButton({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 108.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD8EED3) : Colors.white,
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            color: isSelected ? const Color(0xFF40794F) : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? const Color(0xFF40794F) : Colors.grey),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF40794F) : Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
