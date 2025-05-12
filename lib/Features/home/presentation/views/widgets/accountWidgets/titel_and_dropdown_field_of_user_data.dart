import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:y_balash/core/constants/constants.dart';

class TitelAndDropDownFieldOfUserData extends StatelessWidget {
  final String title;
  final String hintText;
  final String? selectedValue;
  final List<String> options;
  final Function(String?) onChanged;

  const TitelAndDropDownFieldOfUserData({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: kTextFieldAndButtomColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(hintText),
                  value: selectedValue,
                  items: options.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontWeight: selectedValue == item || hintText == item
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: selectedValue == item || hintText == item
                              ? kTextFieldAndButtomColor
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  buttonStyleData: ButtonStyleData(
                    height: 55.h,
                    padding: EdgeInsets.zero,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.grey.shade600,
                      size: 24.h,
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    direction: DropdownDirection.textDirection,
                    offset: Offset(0, -10.h),
                    elevation: 2,
                    openInterval:
                        const Interval(0.0, 1.0, curve: Curves.easeInOut),
                    padding: EdgeInsets.only(top: 6.h),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
