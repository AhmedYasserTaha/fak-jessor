import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const kMainColor = Color(0xFF3F8CFF);
const kMainColor = Color(0xff22577A);
const kGreyTextColor = Color(0xFF7E818C);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF2E2E46);
final kTextStyle = GoogleFonts.dmSans(color: Colors.white);
const kButtonDecoration = BoxDecoration(
  color: kMainColor,
  borderRadius: BorderRadius.all(Radius.circular(40.0)),
);

String purchaseCode = '528cdb9a-5d37-4292-a2b5-b792d5eca03a';

const kInputDecoration = InputDecoration(
  hintStyle: TextStyle(color: kBorderColorTextField),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(6.0)),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kBorderColorTextField),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

List<String> businessCategory = [
  'Fashion Store',
  'Electronics Store',
  'Computer Store',
  'Vegetable Store',
  'Sweet Store',
  'Meat Store',
];
List<String> language = [
  'English',
  'Bengali',
  'Hindi',
  'Urdu',
  'French',
  'Spanish',
];

List<String> productCategory = [
  'Fashion',
  'Electronics',
  'Computer',
  'Gadgets',
  'Watches',
  'Cloths',
];

List<String> userRole = ['Super Admin', 'Admin', 'User'];

List<String> paymentType = ['Cheque', 'Deposit', 'Cash', 'Transfer', 'Sales'];
List<String> posStats = ['Daily', 'Monthly', 'Yearly'];
List<String> saleStats = ['Weekly', 'Monthly', 'Yearly'];
