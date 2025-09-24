// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';

class EditProfile extends StatefulWidget {
  final String name;
  // Add a parameter to receive the current photo
  final dynamic currentPhoto;
  final String phone; // Add phone parameter

  const EditProfile({
    Key? key,
    required this.name,
    this.currentPhoto,
    required this.phone,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    // If a current photo is passed as a File, use it.
    if (widget.currentPhoto is File) {
      _imageFile = widget.currentPhoto;
    }
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
      // Save the image path to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_path', pickedFile.path);
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _updateProfile() {
    // هنا مش هنعمل حفظ في Firebase
    // Save updated phone number to SharedPreferences
    final prefs =
        SharedPreferences.getInstance(); // No await here, will be awaited in pop
    prefs.then(
      (p) => p.setString('user_phone_number', _phoneController.text.trim()),
    );

    Navigator.pop(context, {
      "name": _nameController.text.trim(),
      "image": _imageFile,
      "phone": _phoneController.text.trim(),
    });
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
                    backgroundImage:
                        (_imageFile != null
                                ? FileImage(_imageFile!)
                                : (widget.currentPhoto is String &&
                                      widget.currentPhoto.isNotEmpty)
                                ? NetworkImage(widget.currentPhoto)
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: Text(
                        "Update Profile",
                        style: kTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
