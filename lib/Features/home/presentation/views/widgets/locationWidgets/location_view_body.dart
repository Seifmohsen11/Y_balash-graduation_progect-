import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:y_balash/Features/home/presentation/views/payment_method_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/app_bar_of_location_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/city_dropdown.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/location_label_buttom.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/titel_of_location_text_field.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/locationWidgets/title_and_text_field_of_location_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/add_address_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
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
  bool isLoading = false;
  String? fullAddress, city, area, nearbyLandmark, label = 'home';

  @override
  Widget build(BuildContext context) {
    return SwipeBackWrapper(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarOfLocationView(
                    iconImage: 'assets/icons/arrow.svg',
                    title: 'Add Your Location',
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 23.h),
                  TitelAndTextFieldOfLocationView(
                    title: 'Full Address',
                    hintText: 'Street name, building number',
                    prefixIcon:
                        const Icon(Icons.location_on_sharp, color: Colors.grey),
                    onChange: (value) => fullAddress = value,
                  ),
                  SizedBox(height: 12.h),
                  CityDropdown(onChanged: (value) => city = value),
                  SizedBox(height: 12.h),
                  TitelAndTextFieldOfLocationView(
                    title: 'District / Area',
                    hintText: 'Enter district or area',
                    onChange: (value) => area = value,
                  ),
                  SizedBox(height: 12.h),
                  TitelAndTextFieldOfLocationView(
                    title: 'Nearby Landmark',
                    hintText: 'Any nearby landmark',
                    onChange: (value) => nearbyLandmark = value,
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
                                  label = selectedLabel;
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
                                  label = selectedLabel;
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
                                  label = selectedLabel;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 22.h, left: 14.w, right: 14.w),
          child: SizedBox(
            height: 57.h,
            width: double.infinity,
            child: isLoading
                ? Center(
                    child: SpinKitThreeBounce(
                    color: Colors.blue,
                    size: 18.h,
                  ))
                : CustomButtom(
                    label: 'Confirm',
                    height: 57.h,
                    width: double.infinity,
                    backgorundColor: kTextFieldAndButtomColor,
                    textColor: Colors.white,
                    borderColor: kTextFieldAndButtomColor,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => isLoading = true);
                        try {
                          await addAddress(
                            fullAddress: fullAddress!,
                            city: city!,
                            area: area!,
                            nearbyLandmark: nearbyLandmark!,
                            label: label!.toLowerCase(),
                          );
                          showSnackBar(context, 'Address added successfully',
                              backgroundColor: Colors.green);
                          Navigator.pushNamed(context, PaymentMethodView.id)
                              .then((_) {
                            setState(() => isLoading = false);
                          });
                        } catch (error) {
                          showSnackBar(context,
                              error.toString().replaceAll('Exception: ', ''));
                          setState(() => isLoading = false);
                        }
                      } else {
                        showSnackBar(
                            context, 'Please fill all required fields.');
                      }
                    },
                    borderRadiusSize: 14.w,
                  ),
          ),
        ),
      ),
    );
  }
}
