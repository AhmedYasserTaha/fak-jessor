// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../Authentication/sign_in.dart';
import '../Notification/notification_screen.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // State variables to hold user data
  String _name = 'Loading...';
  String _phone = '';
  String _email = 'Loading...';
  String? _photoURL;
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
          _photoURL = null; // Or a default guest avatar
          _phone = '';
        });
      } else {
        setState(() {
          _name = _user!.displayName ?? 'No Name Set';
          _email = _user!.email ?? 'No Email Set';
          _photoURL = _user!.photoURL;
          _phone = _user!.phoneNumber ?? ''; // Phone number might be empty
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                const NotificationScreen().launch(context);
              },
              child: const Icon(Icons.notifications, color: Colors.white),
            ),
          ),
        ],
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
                backgroundImage: _photoURL != null && _photoURL!.isNotEmpty
                    ? NetworkImage(_photoURL!)
                    : const AssetImage('assets/images/processed-image.png')
                          as ImageProvider,
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
                            EditProfile(name: _name, phone: _phone),
                      ),
                    );
                    if (result == true && mounted) {
                      _loadUserData(); // Reload user data if profile was updated
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
              // ProfileOptions(
              //   title: 'Notification',
              //   image: 'assets/images/notificationicon.png',
              //   pressed: () {},
              //   background: const Color(0xFFE1DDFF),
              // ),
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
    Key? key,
    required this.title,
    required this.image,
    required this.pressed,
    required this.background,
  }) : super(key: key);
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
