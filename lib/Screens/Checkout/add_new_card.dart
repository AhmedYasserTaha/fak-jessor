// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import 'checkout_screen.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Add New Card',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.red,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CreditCardForm(
                          formKey: formKey, // Required
                          onCreditCardModelChange:
                              onCreditCardModelChange, // Required
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          // themeColor: Colors.blue,
                          // textColor: kTitleColor,
                          // cardNumberDecoration: const InputDecoration(
                          //   border: OutlineInputBorder(),
                          //   labelText: 'Number',
                          //   hintText: 'XXXX XXXX XXXX XXXX',
                          // ),
                          // expiryDateDecoration: const InputDecoration(
                          //   border: OutlineInputBorder(),
                          //   labelText: 'Expired Date',
                          //   hintText: 'XX/XX',
                          // ),
                          // cvvCodeDecoration: const InputDecoration(
                          //   border: OutlineInputBorder(),
                          //   labelText: 'CVV',
                          //   hintText: 'XXX',
                          // ),
                          // cardHolderDecoration: const InputDecoration(
                          //   border: OutlineInputBorder(),
                          //   labelText: 'Card Holder',
                          // ),
                        ),
                        ButtonGlobal(
                          buttontext: 'Add Card',
                          buttonDecoration: kButtonDecoration,
                          onPressed: () {
                            const CheckoutScreen().launch(context);
                          },
                        ),
                      ],
                    ),
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
