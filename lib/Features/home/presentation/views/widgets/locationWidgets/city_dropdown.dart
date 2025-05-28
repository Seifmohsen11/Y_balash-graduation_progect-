import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/titel_of_location_text_field.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key, required this.onChanged});

  final Function(String) onChanged;

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  final List<String> _egyptGovernorates = [
    'Ismailia',
    'Cairo',
    'Giza',
    'Alexandria',
    'Dakahlia',
    'Red Sea',
    'Beheira',
    'Fayoum',
    'Gharbiya',
    'Monufia',
    'Minya',
    'Qaliubiya',
    'New Valley',
    'Suez',
    'Aswan',
    'Assiut',
    'Beni Suef',
    'Port Said',
    'Damietta',
    'Sharkia',
    'South Sinai',
    'Kafr El Sheikh',
    'Matrouh',
    'Luxor',
    'Qena',
    'North Sinai',
    'Sohag'
  ];

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleOfLocationTextField(title: 'City'),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            dropdownStyleData: DropdownStyleData(
              offset: Offset(0, -10.h),
              maxHeight: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.w),
              ),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 12.w),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8.w),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8.w),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            hint: Text(
              'Select city',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            items: _egyptGovernorates
                .map((city) => DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select a city';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                selectedCity = value;
              });
              widget.onChanged(value!);
            },
            onSaved: (value) {
              selectedCity = value;
            },
          ),
        ),
      ],
    );
  }
}
