import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/titel_and_text_form_field_of_user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/update_phone_number_service.dart';
import 'package:y_balash/core/helper/show_snackbar.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class UpdatePhoneNumberView extends StatefulWidget {
  const UpdatePhoneNumberView({
    super.key,
    required this.phoneNumber,
  });
  final String? phoneNumber;

  @override
  State<UpdatePhoneNumberView> createState() => _UpdatePhoneNumberViewState();
}

class _UpdatePhoneNumberViewState extends State<UpdatePhoneNumberView> {
  String? updatedPhoneNumber;
  bool _isLoading = false;

  Future<void> handleUpdateNumber() async {
    final phoneNumberToSend = updatedPhoneNumber ?? widget.phoneNumber;

    if (phoneNumberToSend == null) {
      showSnackBar(context, 'Please add phone number');
      return;
    }
    // check the number
    final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (!regex.hasMatch(phoneNumberToSend)) {
      showSnackBar(context, 'Please enter a valid Egyptian phone number.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await updatePhoneNumber(
        phoneNumber: phoneNumberToSend,
      );

      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 300));
      showSnackBar(context, 'Phone Number updated successfully!',
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
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackArrow(),
            SizedBox(
              height: 12.h,
            ),
            TitelAndTextFormFieldOfUserData(
              titel: 'Phone Number',
              hintText: widget.phoneNumber ?? '+20',
              onChange: (value) {
                updatedPhoneNumber = value;
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
                        onTap: handleUpdateNumber,
                        borderRadiusSize: 12.w,
                      ),
              ],
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ));
  }
}
