import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/update_birthday_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class UpdateBirthdayView extends StatefulWidget {
  const UpdateBirthdayView({super.key, this.currentBirthday});
  final String? currentBirthday;

  @override
  State<UpdateBirthdayView> createState() => _UpdateBirthdayViewState();
}

class _UpdateBirthdayViewState extends State<UpdateBirthdayView> {
  DateTime? selectedDate;
  bool _isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select your birthday',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kTextFieldAndButtomColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: kTextFieldAndButtomColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> handleUpdateBirthday() async {
    if (selectedDate == null) {
      showSnackBar(context, 'Please select your birthday.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final birthday = DateFormat('yyyy-MM-dd').format(selectedDate!);
      await updateUserBirthday(birthday: birthday);

      showSnackBar(
        context,
        'Birthday updated successfully!',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: Text(
                    'Your Birthday',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: kTextFieldAndButtomColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    height: 55.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            selectedDate != null
                                ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                                : widget.currentBirthday ??
                                    'Select your birthday',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: selectedDate != null
                                  ? kTextFieldAndButtomColor
                                  : Colors.grey,
                              fontWeight: selectedDate != null
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                        ImageIcon(
                          const AssetImage('assets/images/birthday.png'),
                          size: 20.sp,
                          color: kTextFieldAndButtomColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator(
                      color: kTextFieldAndButtomColor,
                    )
                  : CustomButtom(
                      label: 'Save',
                      height: 57.h,
                      width: 343.w,
                      backgorundColor: kTextFieldAndButtomColor,
                      textColor: Colors.white,
                      borderColor: kTextFieldAndButtomColor,
                      onTap: handleUpdateBirthday,
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
