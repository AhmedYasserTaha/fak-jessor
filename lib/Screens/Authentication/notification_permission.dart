// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home/home.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({Key? key}) : super(key: key);

  @override
  _NotificationPermissionState createState() => _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF1F0),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFFCF1F0)),
        backgroundColor: const Color(0xFFFCF1F0),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('assets/images/notification.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Stay notified about, new course update, scoreboard status",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 10.0,
              ),
              child: ButtonGlobal(
                buttontext: 'Allow',
                onPressed: () {
                  const Home().launch(context);
                },
                buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
              ),
            ),
            TextButton(
              onPressed: () {
                const Home().launch(context);
              },
              child: Text(
                'Skip',
                style: GoogleFonts.dmSans(
                  fontSize: 16.0,
                  color: kGreyTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
