// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../Authentication/sign_in.dart';
import '../Notification/notification_screen.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables to hold user data
  String _name = 'Loading...';
  String _phone = '';
  String _email = 'Loading...';
  dynamic _photo; // Can be a URL String or a File object
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null && mounted) {
      if (_user!.isAnonymous) {
        setState(() {
          _name = 'Guest User';
          _email = 'Sign in to unlock all features';
          _photo = null; // Or a default guest avatar
          _phone = '';
        });
      } else {
        // Load image from SharedPreferences first
        final prefs = await SharedPreferences.getInstance();
        final imagePath = prefs.getString('profile_image_path');
        setState(() {
          _name = _user!.displayName ?? 'No Name Set';
          _email = _user!.email ?? 'No Email Set';
          if (imagePath != null) {
            _photo = File(imagePath);
          } else {
            _photo = _user!.photoURL;
          }
          // Load phone number from SharedPreferences, fallback to Firebase or empty
          final storedPhoneNumber = prefs.getString('user_phone_number');
          _phone = storedPhoneNumber ?? _user!.phoneNumber ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Profile', style: kTextStyle.copyWith(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              CircleAvatar(
                radius: 60.0,
                backgroundColor: kTitleColor,
                backgroundImage: _photo != null
                    ? (_photo is File
                              ? FileImage(_photo as File)
                              : (_photo is String && _photo.isNotEmpty)
                              ? NetworkImage(_photo as String)
                              : const AssetImage(
                                  'assets/images/processed-image.png',
                                ))
                          as ImageProvider
                    : const AssetImage('assets/images/processed-image.png'),
              ),
              const SizedBox(height: 20.0),
              Text(
                _name,
                style: kTextStyle.copyWith(
                  color: kTitleColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _email,
                style: kTextStyle.copyWith(
                  color: kGreyTextColor,
                  fontSize: 14.0,
                ),
              ),
              Text(
                _phone,
                style: kTextStyle.copyWith(
                  color: kGreyTextColor,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 20.0),
              if (_user != null && !_user!.isAnonymous)
                ProfileOptions(
                  title: 'Edit Profile',
                  image: 'assets/images/editprofileicon.png',
                  pressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            // Pass the current phone number to EditProfile
                            EditProfile(
                              name: _name,
                              currentPhoto: _photo,
                              phone: _phone,
                            ),
                      ),
                    ); // The result will be a Map

                    if (result != null && result is Map && mounted) {
                      setState(() {
                        _name = result['name'] as String;
                        if (result['image'] != null) {
                          _photo = result['image'];
                          _phone =
                              result['phone']
                                  as String; // Update phone from result
                        }
                      });
                    }
                  },
                  background: const Color(0xFFFBECD9),
                ),
              // ProfileOptions(
              //   title: 'Payment Details',
              //   image: 'assets/images/paymentdetailsicon.png',
              //   pressed: () {},
              //   background: const Color(0xFFD2E4FF),
              // ),
              ProfileOptions(
                title: 'Notification',
                image: 'assets/images/notificationicon.png',
                pressed: () {
                  const NotificationScreen().launch(context);
                },
                background: const Color(0xFFE1DDFF),
              ),
              // ProfileOptions(
              //   title: 'WishList',
              //   image: 'assets/images/wishlisticon.png',
              //   pressed: () {},
              //   background: const Color(0xFFFBEAE2),
              // ),
              // ProfileOptions(
              //   title: 'Language',
              //   image: 'assets/images/languageicon.png',
              //   pressed: () {},
              //   background: const Color(0xFFD5EDED),
              // ),
              ProfileOptions(
                title: 'Log Out',
                image: 'assets/images/logouticon.png',
                pressed: () async {
                  await FirebaseAuth.instance.signOut();
                  const SignIn().launch(context, isNewTask: true);
                },
                background: const Color(0xFFF8E2E2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileOptions extends StatelessWidget {
  ProfileOptions({
    super.key,
    required this.title,
    required this.image,
    required this.pressed,
    required this.background,
  });
  String title, image;
  Color background;

  // ignore: prefer_typing_uninitialized_variables
  var pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: GestureDetector(
        onTap: pressed,
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: kButtonDecoration.copyWith(color: background),
          child: Center(
            child: ListTile(
              leading: Image.asset(image),
              title: Text(
                title,
                style: kTextStyle.copyWith(color: kTitleColor),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: kTitleColor),
            ),
          ),
        ),
      ),
    );
  }
}
