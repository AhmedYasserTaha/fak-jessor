// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jessor/Screens/Home/home.dart';
import 'package:jessor/Screens/SplashScreen/on_board.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // انتظر قليلاً ثم تحقق من حالة المصادقة
    Timer(const Duration(seconds: 3), _checkAuthStatus);
  }

  void _checkAuthStatus() {
    // استخدم listen لتجنب مشاكل الـ context بعد async call
    FirebaseAuth.instance.authStateChanges().first.then((User? user) {
      if (mounted) {
        if (user == null) {
          // المستخدم غير مسجل دخوله، اذهب إلى شاشة OnBoarding
          const OnBoard().launch(context, isNewTask: true);
        } else {
          // المستخدم مسجل دخوله، اذهب إلى الشاشة الرئيسية
          const Home().launch(context, isNewTask: true);
        }
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: const BoxDecoration(color: Colors.white)),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("assets/images/round_logo.png")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
