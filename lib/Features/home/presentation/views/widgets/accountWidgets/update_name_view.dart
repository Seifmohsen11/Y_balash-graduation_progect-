import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/titel_and_text_form_field_of_user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/sectionsViews/back_arrow.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class UpdateNameView extends StatelessWidget {
  const UpdateNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackArrow(),
            SizedBox(
              height: 40.h,
            ),
            const TitelAndTextFormFieldOfUserData(
              titel: 'First Name',
              hintText: 'Seif',
            ),
            SizedBox(
              height: 24.h,
            ),
            const TitelAndTextFormFieldOfUserData(
              titel: 'Last Name',
              hintText: 'mohsen',
            ),
            SizedBox(
              height: 450.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtom(
                    label: 'Save',
                    height: 57.h,
                    width: 343.w,
                    backgorundColor: kTextFieldAndButtomColor,
                    textColor: Colors.white,
                    borderColor: kTextFieldAndButtomColor,
                    onTap: () {},
                    borderRadiusSize: 12),
              ],
            )
          ],
        ));
  }
}
