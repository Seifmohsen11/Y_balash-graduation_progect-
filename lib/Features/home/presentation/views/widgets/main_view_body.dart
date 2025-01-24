import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: kPrimaryColor,
        items: const <Widget>[
          ImageIcon(
            AssetImage("assets/icons/home.png"),
            size: 50,
          ),
          ImageIcon(
            AssetImage("assets/icons/search.png"),
            size: 50,
          ),
          ImageIcon(
            AssetImage("assets/icons/chatBot.png"),
            size: 50,
          ),
          ImageIcon(
            AssetImage("assets/icons/favourite.png"),
            size: 50,
          ),
          ImageIcon(
            AssetImage("assets/icons/account.png"),
            size: 50,
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
  HomeView(),
  SearchView(),
  ChatPotView(),
  FavouriteView(),
  AccountView(),
];
