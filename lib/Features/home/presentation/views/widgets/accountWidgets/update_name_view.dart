import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/titel_and_text_form_field_of_user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/update_user_name_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/helper/swip_back_wrapper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class UpdateNameView extends StatefulWidget {
  const UpdateNameView(
      {super.key, required this.firstName, required this.lastName});
  final String? firstName;
  final String? lastName;

  @override
  State<UpdateNameView> createState() => _UpdateNameViewState();
}

class _UpdateNameViewState extends State<UpdateNameView> {
  String? updatedFirstName, updatedLastName;
  bool _isLoading = false;

  Future<void> handleUpdateName() async {
    final firstNameToSend = updatedFirstName ?? widget.firstName;
    final lastNameToSend = updatedLastName ?? widget.lastName;

    if (firstNameToSend == null || lastNameToSend == null) {
      showSnackBar(context, 'Please fill in both names.');
      return;
    }

    if (firstNameToSend.length > 15 || lastNameToSend.length > 15) {
      showSnackBar(context, 'Each name must be at most 15 characters.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await updateUserName(
        firstName: firstNameToSend,
        lastName: lastNameToSend,
      );

      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 300));
      showSnackBar(context, 'Name updated successfully!',
          backgroundColor: Colors.green);
      Navigator.pop(context, true);
    } catch (error) {
      showSnackBar(context, error.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SwipeBackWrapper(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackArrow(),
              SizedBox(
                height: 12.h,
              ),
              TitelAndTextFormFieldOfUserData(
                titel: 'First Name',
                hintText: widget.firstName ?? 'Enter your first name',
                onChange: (value) {
                  updatedFirstName = value;
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              TitelAndTextFormFieldOfUserData(
                titel: 'Last Name',
                hintText: widget.lastName ?? 'Enter your last name',
                onChange: (value) {
                  updatedLastName = value;
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: kTextFieldAndButtomColor))
                      : CustomButtom(
                          label: 'Save',
                          height: 57.h,
                          width: 343.w,
                          backgorundColor: kTextFieldAndButtomColor,
                          textColor: Colors.white,
                          borderColor: kTextFieldAndButtomColor,
                          onTap: handleUpdateName,
                          borderRadiusSize: 12.w,
                        ),
                ],
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          )),
    );
  }
}
