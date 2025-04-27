import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/login_view.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/UserImageAndNameAndEmail.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/update_name_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});
  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

// Function to log out the user by removing the token from SharedPreferences
  Future<void> logOut(BuildContext context) async {
    // Clear the token from SharedPreferences
    await SharedPrefHelper.clearToken();

    // Navigate to the Login screen
    Navigator.pushReplacementNamed(context, LoginView.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.only(left: getProportionalWidth(context, 16)),
          child: Column(
            children: [
              SizedBox(height: getProportionalHeight(context, 42)),
              AppBarOfCartView(
                screenWidth: getProportionalWidth(context, 430),
                iconImage: 'assets/icons/Arrow.png',
                title: 'Profile',
                onPressed: () {
                  Navigator.popAndPushNamed(context, MainView.id);
                },
              ),
              SizedBox(height: getProportionalHeight(context, 40)),
              const UserImageAndNameAndEmail(),
              SizedBox(height: getProportionalHeight(context, 22)),
              UserData(
                image: 'assets/images/name.png',
                label: 'Name',
                data: 'Seif Mohsen',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const UpdateNameView();
                      },
                    ),
                  );
                },
              ),
              UserData(
                image: 'assets/images/gender.png',
                label: 'Gender',
                data: 'Male',
                onTap: () {},
              ),
              UserData(
                image: 'assets/images/birthday.png',
                label: 'Birthday',
                data: '11-5-2003',
                onTap: () {},
              ),
              UserData(
                image: 'assets/images/phone_number.png',
                label: 'Phone Number',
                data: '01211161931',
                onTap: () {},
              ),
              SizedBox(height: getProportionalHeight(context, 120)),
              CustomButtom(
                  label: 'Log out',
                  height: getProportionalHeight(context, 55),
                  width: getProportionalWidth(context, 130),
                  backgorundColor: Colors.red,
                  textColor: Colors.white,
                  borderColor: Colors.white,
                  onTap: () {
                    logOut(context);
                  },
                  borderRadiusSize: getProportionalWidth(context, 32))
            ],
          ),
        ));
  }
}
