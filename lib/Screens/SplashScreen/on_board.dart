// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jessor/Screens/Authentication/sign_in.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'assets/images/onboard1.png',
      "title": 'Welcome to Jessor',
      "description":
          'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam erat volutpat. Ut wi',
    },
    {
      "icon": 'assets/images/onboard2.png',
      "title": 'Explore Your New Skill',
      "description":
          'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam erat volutpat. Ut wi',
    },
    {
      "icon": 'assets/images/onboard3.png',
      "title": 'Ready To Find A Course?',
      "description":
          'Lorem ipsum dolor sit amet, consectetuer adipisci elit, sed diam nonummy nibh euismod tincidunt u laoreet dolore magna aliquam erat volutpat. Ut wi',
    },
  ];
  void goNext() {
    if (currentIndexPage < sliderList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: sliderList.length,
              onPageChanged: (index) {
                setState(() => currentIndexPage = index);
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(sliderList[index]['icon'], height: 250),
                    const SizedBox(height: 20),
                    Text(
                      sliderList[index]['title'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        sliderList[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Dots indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              sliderList.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                width: currentIndexPage == index ? 12 : 8,
                height: currentIndexPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndexPage == index
                      ? const Color(0xff22577A)
                      : Colors.grey.shade400,
                ),
              ),
            ),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Color(0xff22577A), fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff22577A),
                  ),
                  onPressed: goNext,
                  child: Text(
                    style: const TextStyle(color: Colors.white),
                    currentIndexPage == sliderList.length - 1
                        ? "Start"
                        : "Next",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
