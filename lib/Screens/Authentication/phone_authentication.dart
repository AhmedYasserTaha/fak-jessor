// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../GlobalComponents/otp_form.dart';
import '../../constant.dart';
import 'notification_permission.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Phone Verification',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "We have sent code to your number +9176765434321",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const OtpForm(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "You can request OTP after 01:52",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                          color: kMainColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ButtonGlobal(
                      buttontext: 'Verify',
                      onPressed: () {
                        const NotificationPermission().launch(context);
                      },
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kMainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
