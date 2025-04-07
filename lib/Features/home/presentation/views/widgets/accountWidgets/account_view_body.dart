import 'package:flutter/material.dart';
import 'package:y_balash/Features/authentication/presentation/views/login_view.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/UserImageAndNameAndEmail.dart';
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
              const UserData(
                  image: 'assets/images/name.png',
                  label: 'Name',
                  data: 'Seif Mohsen'),
              const UserData(
                  image: 'assets/images/gender.png',
                  label: 'Gender',
                  data: 'Male'),
              const UserData(
                  image: 'assets/images/birthday.png',
                  label: 'Birthday',
                  data: '11-5-2003'),
              const UserData(
                  image: 'assets/images/phone_number.png',
                  label: 'Phone Number',
                  data: '01211161931'),
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

class UserData extends StatelessWidget {
  final String image;
  final String label;
  final String data;
  const UserData(
      {super.key,
      required this.image,
      required this.label,
      required this.data});
  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionalHeight(context, 54),
      width: getProportionalWidth(context, 398),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalWidth(context, 32)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image),
                SizedBox(
                  width: getProportionalWidth(context, 16),
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: getProportionalWidth(context, 12),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff223263)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  data,
                  style: TextStyle(
                      fontSize: getProportionalWidth(context, 12),
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: getProportionalWidth(context, 8),
                ),
                Image.asset('assets/images/Vector.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
