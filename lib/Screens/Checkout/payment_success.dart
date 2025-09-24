// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home/home.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({Key? key}) : super(key: key);

  @override
  _PaymentSuccessfulState createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Debit Card',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: '4563232134434545',
              expiryDate: '11/24',
              cardHolderName: 'Prince Mahmud',
              cvvCode: '084',
              showBackView: false,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Amount Section',
                          style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          decoration: const InputDecoration(
                            labelText: 'Billing Name',
                            hintText: 'Prince Mahmud',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: TextEditingController(text: '\$112.99'),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            hintText: '\$112.99',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AppTextField(
                          textFieldType: TextFieldType.PASSWORD,
                          decoration: const InputDecoration(
                            labelText: 'CVV',
                            hintText: '3 Digit CVV',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      ButtonGlobal(
                        buttontext: 'Pay Now',
                        buttonDecoration: kButtonDecoration,
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              // ignore: sized_box_for_whitespace
                              child: SizedBox(
                                height: 400.0,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20.0),
                                    const Image(
                                      image: AssetImage(
                                        'assets/images/paymentsuccess.png',
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      'Excellent',
                                      style: kTextStyle.copyWith(
                                        color: kMainColor,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      'Payment Successful',
                                      style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    ButtonGlobal(
                                      buttontext: 'Back To Home',
                                      buttonDecoration: kButtonDecoration,
                                      onPressed: () {
                                        const Home().launch(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
