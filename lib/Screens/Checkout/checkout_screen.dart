// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:jessor/Screens/Checkout/payment_success.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import 'add_new_card.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool debitCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Checkout', style: kTextStyle.copyWith(color: kTitleColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Select a Payment Method',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: debitCard ? kMainColor : Colors.white,
                    ),
                    child: ListTile(
                      leading: Image.asset('assets/images/debitcardicon.png'),
                      title: Text(
                        'Debit Card',
                        style: kTextStyle.copyWith(
                          color: debitCard ? Colors.white : kTitleColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      child: Image.asset('assets/images/bkash.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      child: Image.asset('assets/images/stripe.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      child: Image.asset('assets/images/paypal.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      child: Image.asset('assets/images/paytm.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      child: Image.asset('assets/images/ssl.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Select your card',
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const CardWidget(),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                const AddCard().launch(context);
              },
              child: Row(
                children: [
                  Text(
                    'Add new Card',
                    style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.add_box_rounded, color: Color(0xFF453D80)),
                ],
              ),
            ),
            const Spacer(),
            ButtonGlobal(
              buttontext: 'Continue',
              buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
              onPressed: () {
                const PaymentSuccessful().launch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: CreditCardWidget(
        cardNumber: '4591765865654341',
        expiryDate: '11/26',
        cardHolderName: 'Prince Mahmud',
        cvvCode: '083',
        showBackView: false,
        cardBgColor: Colors.red,
        obscureCardNumber: true,
        obscureCardCvv: true,
        isHolderNameVisible: true,
        height: 175,
        textStyle: const TextStyle(color: Colors.white),
        width: MediaQuery.of(context).size.width,
        isChipVisible: true,
        isSwipeGestureEnabled: true,
        animationDuration: const Duration(milliseconds: 1000),
        onCreditCardWidgetChange: (CreditCardBrand) {},
      ),
    );
  }
}
