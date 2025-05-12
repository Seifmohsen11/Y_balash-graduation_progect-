import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/titel_and_dropdown_field_of_user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/update_gender_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class UpdateGenderView extends StatefulWidget {
  const UpdateGenderView({super.key, this.hintTextGender});
  final String? hintTextGender;
  @override
  State<UpdateGenderView> createState() => _UpdateGenderViewState();
}

class _UpdateGenderViewState extends State<UpdateGenderView> {
  final List<String> genderOptions = ['male', 'female', 'other'];
  String? selectedGender;

  bool _isLoading = false;

  Future<void> handleUpdateGender() async {
    if (selectedGender == null) {
      showSnackBar(context, 'Please select a gender.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await updateUserGender(gender: selectedGender!);

      showSnackBar(
        context,
        'Gender updated successfully!',
        backgroundColor: Colors.green,
      );

      Navigator.pop(context, true);
    } catch (error) {
      showSnackBar(
        context,
        error.toString().replaceAll('Exception: ', ''),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackArrow(),
          TitelAndDropDownFieldOfUserData(
            title: 'Choose Gender',
            hintText: widget.hintTextGender ?? 'Select Gender',
            selectedValue: selectedGender,
            options: genderOptions,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor)
                  : CustomButtom(
                      label: 'Save',
                      height: 57.h,
                      width: 343.w,
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: handleUpdateGender,
                      borderRadiusSize: 12.w,
                    ),
            ],
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
