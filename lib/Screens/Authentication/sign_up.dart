// import 'package:country_code_picker/country_code_picker.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jessor/Screens/Authentication/sign_in.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    EasyLoading.show(status: 'Creating Account...');
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      // هنا نقوم بتحديث ملف المستخدم لإضافة الاسم
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(
          _nameController.text.trim(),
        );
      }

      EasyLoading.dismiss();
      const Home().launch(context, isNewTask: true);
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      String message = 'An error occurred. Please try again.';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      EasyLoading.dismiss();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 'logo',
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Image.asset(
                              'assets/images/round_logo.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AppTextField(
                            textFieldType: TextFieldType.NAME,
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                hintText: '1767 432556',
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AppTextField(
                            textFieldType: TextFieldType.EMAIL,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                              hintText: 'example@example.com',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: AppTextField(
                            textFieldType: TextFieldType.PASSWORD,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        ButtonGlobal(
                          buttontext: 'Sign Up',
                          buttonDecoration: kButtonDecoration,
                          onPressed: _signUp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Divider(thickness: 1.0, color: kGreyTextColor),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         'Or Sign Up With...',
              //         style: kTextStyle.copyWith(
              //           color: kGreyTextColor,
              //           fontSize: 12.0,
              //         ),
              //       ),
              //     ),
              //     const Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.all(8.0),
              //         child: Divider(thickness: 1.0, color: kGreyTextColor),
              //       ),
              //     ),
              //   ],
              // ),
              // Hero(
              //   tag: 'social',
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Card(
              //           elevation: 0.0,
              //           color: Colors.white,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           child: const Padding(
              //             padding: EdgeInsets.only(
              //               left: 20.0,
              //               right: 20.0,
              //               top: 10.0,
              //               bottom: 10.0,
              //             ),
              //             child: Center(
              //               child: Icon(
              //                 FontAwesomeIcons.facebookF,
              //                 color: Color(0xFF3B5998),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Card(
              //         elevation: 0.0,
              //         color: Colors.white,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(
              //             left: 20.0,
              //             right: 20.0,
              //             top: 10.0,
              //             bottom: 10.0,
              //           ),
              //           child: Center(
              //             child: Image.asset(
              //               'assets/images/google.png',
              //               height: 25.0,
              //               width: 25.0,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Card(
              //           elevation: 0.0,
              //           color: Colors.white,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //           ),
              //           child: const Padding(
              //             padding: EdgeInsets.only(
              //               left: 20.0,
              //               right: 20.0,
              //               top: 10.0,
              //               bottom: 10.0,
              //             ),
              //             child: Center(
              //               child: Icon(
              //                 FontAwesomeIcons.twitter,
              //                 color: Color(0xFF3FBCFF),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Have an Account? ',
                      style: kTextStyle.copyWith(
                        color: kGreyTextColor,
                        fontSize: 14.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        const SignIn().launch(context);
                      },
                      child: Text(
                        'Log In',
                        style: kTextStyle.copyWith(
                          color: kMainColor,
                          fontSize: 14.0,
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
