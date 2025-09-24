// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../constant.dart';
import '../Chat/chat_list.dart';
import '../Profile/profile_screen.dart';
import 'home_screen.dart';
import 'my_courses.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyCourses(),
    // WishListScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.fromBorderSide(
            BorderSide(color: kMainColor, width: 1.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          unselectedItemColor: kTitleColor,
          selectedItemColor: kMainColor,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_rounded),
              title: const Text("Home"),
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.text_snippet_rounded),
              title: const Text("My Course"),
            ),

            /// Search
            // SalomonBottomBarItem(
            //   icon: const Icon(Icons.favorite_rounded),
            //   title: const Text("Wishlist"),
            // ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.textsms_rounded),
              title: const Text("Chat"),
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }
}
