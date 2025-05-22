import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:y_balash/Features/home/presentation/views/account_view.dart';
import 'package:y_balash/Features/home/presentation/views/chat_bot_view.dart';
import 'package:y_balash/Features/home/presentation/views/favourite_view.dart';
import 'package:y_balash/Features/home/presentation/views/home_view.dart';
import 'package:y_balash/Features/home/presentation/views/search_view.dart';
import 'package:y_balash/core/constants/constants.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.green.withOpacity(.7),
        backgroundColor: kPrimaryColor,
        items: <Widget>[
          SvgPicture.asset(
            "assets/icons/home.svg",
            // ignore: deprecated_member_use
            color: Colors.black,
            height: 60.h,
          ),
          SvgPicture.asset(
            "assets/icons/mainSearch.svg",
            height: 50.h,
          ),
          SvgPicture.asset(
            "assets/icons/chat_bot.svg",
            height: 60.h,
          ),
          SvgPicture.asset(
            "assets/icons/favourite.svg",
            height: 50.h,
          ),
          SvgPicture.asset(
            "assets/icons/account.svg",
            height: 50.h,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: pages[selectedIndex],
    );
  }
}

List<Widget> pages = [
  const HomeView(),
  const SearchView(),
  const ChatPotView(),
  const FavouriteView(),
  const AccountView(),
];
