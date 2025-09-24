// import 'package:country_code_picker/country_code_picker.dart';
// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String phone;

  const EditProfile({Key? key, required this.name, required this.phone})
    : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  User? _user;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _updateProfile() async {
    if (_user == null) return;

    EasyLoading.show(status: 'Updating...');

    try {
      String? photoURL = _user!.photoURL;

      // 1. Upload new image if selected
      if (_imageFile != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_pictures')
            .child('${_user!.uid}.jpg');
        await storageRef.putFile(_imageFile!);
        photoURL = await storageRef.getDownloadURL();
      }

      // 2. Update user profile in FirebaseAuth
      await _user!.updateDisplayName(_nameController.text.trim());
      await _user!.updatePhotoURL(photoURL);

      EasyLoading.dismiss();
      // Reload user to get the latest data
      await _user!.reload();

      // Return to profile screen
      Navigator.pop(context, true); // Pass true to indicate success
    } catch (e) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to update profile: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.only(right: 15.0),
        //     child: Icon(FontAwesomeIcons.solidBell),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!) as ImageProvider
                        : (_user?.photoURL != null &&
                                      _user!.photoURL!.isNotEmpty
                                  ? NetworkImage(_user!.photoURL!)
                                  : const AssetImage(
                                      "assets/images/processed-image.png",
                                    ))
                              as ImageProvider,
                    backgroundColor: kTitleColor,
                  ),
                  Positioned(
                    bottom: -10.0,
                    right: -10.0,
                    child: IconButton(
                      icon: Image.asset('assets/images/editpicicon.png'),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        'Basic Details',
                        style: kTextStyle.copyWith(
                          color: kTitleColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full name',
                            hintText: 'Prince Mahmud',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 60.0,
                          child: AppTextField(
                            textFieldType: TextFieldType.PHONE,
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                              hintText: '+1767 432556',
                              border: OutlineInputBorder(),
                              // prefix: CountryCodePicker(
                              //   padding: EdgeInsets.zero,
                              //   onChanged: print,
                              //   initialSelection: 'BD',
                              //   showFlag: true,
                              //   showDropDownButton: true,
                              //   alignLeft: false,
                              // ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: AppTextField(
                      //     textFieldType: TextFieldType.EMAIL,
                      //     controller: _emailController,
                      //     decoration: const InputDecoration(
                      //       labelText: 'Email Address',
                      //       hintText: 'example@example.com',
                      //       border: OutlineInputBorder(),
                      //     ),
                      //   ),
                      // ),
                      ButtonGlobal(
                        buttontext: 'Update Profile',
                        buttonDecoration: kButtonDecoration,
                        onPressed: _updateProfile,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
