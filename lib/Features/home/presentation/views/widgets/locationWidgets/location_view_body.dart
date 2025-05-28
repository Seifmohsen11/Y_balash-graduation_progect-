import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/payment_method_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/app_bar_of_location_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/city_dropdown.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/location_label_buttom.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/titel_of_location_text_field.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/title_and_text_field_of_location_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class LocationViewBody extends StatefulWidget {
  const LocationViewBody({super.key});

  @override
  State<LocationViewBody> createState() => _LocationViewBodyState();
}

class _LocationViewBodyState extends State<LocationViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedLabel = 'Home';

  @override
  Widget build(BuildContext context) {
    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppBarOfLocationView(
                      iconImage: 'assets/icons/arrow.svg',
                      title: 'Add Your Location',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 23.h,
                  ),
                  const TitelAndTextFieldOfLocationView(
                    title: 'Full Address',
                    hintText: 'Street name, building number',
                    prefixIcon: Icon(
                      Icons.location_on_sharp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  CityDropdown(onChanged: (city) {
                    print('Selected city: $city');
                    // تقدر تخزنها في variable لو هتبعتها لل API
                  }),
                  SizedBox(
                    height: 12.h,
                  ),
                  const TitelAndTextFieldOfLocationView(
                    title: 'District / Area',
                    hintText: 'Enter district or area',
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const TitelAndTextFieldOfLocationView(
                    title: 'Nearby Landmark',
                    hintText: 'Any nearby landmark',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleOfLocationTextField(title: 'Label'),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LocationLabelButton(
                              label: 'Home',
                              icon: Icons.home,
                              isSelected: selectedLabel == 'Home',
                              onTap: () {
                                setState(() {
                                  selectedLabel = 'Home';
                                });
                              },
                            ),
                            LocationLabelButton(
                              label: 'Work',
                              icon: Icons.work,
                              isSelected: selectedLabel == 'Work',
                              onTap: () {
                                setState(() {
                                  selectedLabel = 'Work';
                                });
                              },
                            ),
                            LocationLabelButton(
                              label: 'Other',
                              icon: Icons.location_on,
                              isSelected: selectedLabel == 'Other',
                              onTap: () {
                                setState(() {
                                  selectedLabel = 'Other';
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: CustomButtom(
                      label: 'Confirm',
                      height: 57.h,
                      width: 398.w,
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: () {
                        Navigator.pushNamed(context, PaymentMethodView.id);
                      },
                      borderRadiusSize: 14.w,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
