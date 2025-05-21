import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:y_balash/Features/authentication/presentation/views/login_view.dart';
import 'package:y_balash/Features/home/presentation/views/main_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/UserImageAndNameAndEmail.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/update_birthday_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/update_gender_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/update_name_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/update_phone_number_view.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/accountWidgets/user_data.dart';
import 'package:y_balash/Features/home/presentation/views/widgets/cartWidgets/app_bar_of_cart_view.dart';
import 'package:y_balash/core/constants/constants.dart';
import 'package:y_balash/core/data/services/home/get_user_info_service.dart';
import 'package:y_balash/core/data/services/home/update_profile_image_service.dart';
import 'package:y_balash/core/helper/shared_pref_helper.dart';
import 'package:y_balash/core/widgets/custom_buttom.dart';

class AccountViewBody extends StatefulWidget {
  const AccountViewBody({super.key});

  @override
  State<AccountViewBody> createState() => _AccountViewBodyState();
}

class _AccountViewBodyState extends State<AccountViewBody> {
  Map<String, dynamic> userInfo = {};
  bool isLoading = true;
  bool isImageUpdating = false;

  double getProportionalHeight(BuildContext context, double originalHeight) {
    return (originalHeight / 932) * MediaQuery.of(context).size.height;
  }

  double getProportionalWidth(BuildContext context, double originalWidth) {
    return (originalWidth / 430) * MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  Future<void> fetchUserInfo() async {
    try {
      final info = await getUserInfo();

      if (mounted) {
        setState(() {
          userInfo = info;
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching info: $error');

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: isLoading
            ? Center(
                key: ValueKey('loading'),
                child: SpinKitThreeBounce(
                  color: Colors.blue,
                  size: 28.h,
                ),
              )
            : Padding(
                key: const ValueKey('content'),
                padding:
                    EdgeInsets.only(left: getProportionalWidth(context, 8)),
                child: Column(
                  children: [
                    SafeArea(
                      child: AppBarOfCartView(
                        screenWidth: getProportionalWidth(context, 430),
                        iconImage: 'assets/icons/arrow.svg',
                        title: 'Profile',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, MainView.id);
                        },
                      ),
                    ),
                    SizedBox(height: getProportionalHeight(context, 32)),
                    UserImageAndNameAndEmail(
                      image: userInfo["profileImage"],
                      userName: userInfo["username"] ?? "",
                      email: userInfo["email"] ?? "",
                      isLoading: isImageUpdating,
                      onImageChanged: (XFile? file) async {
                        if (file != null) {
                          setState(() {
                            isImageUpdating = true;
                          });

                          // Call API to upload image
                          await updateProfileImage(file); // مثلاً
                          await fetchUserInfo();
                          if (mounted) {
                            setState(() {
                              isImageUpdating = false;
                            });
                          }
                        }
                      },
                      onImageRemoved: () async {
                        setState(() {
                          isImageUpdating = true;
                        });
                        await updateProfileImage(
                            null); // Call API to remove image
                        await fetchUserInfo();
                        if (mounted) {
                          setState(() {
                            isImageUpdating = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: getProportionalHeight(context, 22)),
                    UserData(
                      image: 'assets/images/name.png',
                      label: 'Name',
                      data:
                          "${userInfo["firstName"] ?? ""} ${userInfo["lastName"] ?? ""}",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateNameView(
                                firstName: userInfo["firstName"],
                                lastName: userInfo["lastName"],
                              );
                            },
                          ),
                        ).then((shouldRefresh) {
                          if (shouldRefresh == true) {
                            fetchUserInfo();
                          }
                        });
                      },
                    ),
                    UserData(
                      image: 'assets/images/gender.png',
                      label: 'Gender',
                      data: userInfo["gender"] ?? '',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateGenderView(
                                hintTextGender: userInfo["gender"],
                              );
                            },
                          ),
                        ).then((shouldRefresh) {
                          if (shouldRefresh == true) {
                            fetchUserInfo();
                          }
                        });
                      },
                    ),
                    UserData(
                      image: 'assets/images/birthday.png',
                      label: 'Birthday',
                      data: userInfo["birthday"] ?? '',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateBirthdayView(
                                currentBirthday: userInfo["birthday"],
                              );
                            },
                          ),
                        ).then((shouldRefresh) {
                          if (shouldRefresh == true) {
                            fetchUserInfo();
                          }
                        });
                      },
                    ),
                    UserData(
                      image: 'assets/images/phone_number.png',
                      label: 'Phone Number',
                      data: userInfo["phone"] ?? '',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdatePhoneNumberView(
                                phoneNumber: userInfo["phone"],
                              );
                            },
                          ),
                        ).then((shouldRefresh) {
                          if (shouldRefresh == true) {
                            fetchUserInfo();
                          }
                        });
                      },
                    ),
                    const Spacer(),
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
                      borderRadiusSize: getProportionalWidth(context, 32),
                    ),
                    SizedBox(
                      height: getProportionalHeight(context, 84),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
