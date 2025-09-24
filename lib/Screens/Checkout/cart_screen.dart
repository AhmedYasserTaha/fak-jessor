// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Best Instructors',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                const NotificationScreen().launch(context);
              },
              child: const Icon(FontAwesomeIcons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F5F2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/coursethumbnail1.png'),
                    height: 60.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Interface Design',
                            softWrap: true,
                            style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'By Talent Tamer ',
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                          Row(
                            children: [
                              Text(
                                '(4.5)',
                                style: kTextStyle.copyWith(
                                  color: const Color(0xFFF5B400),
                                ),
                              ),
                              const Icon(
                                Icons.star_rounded,
                                color: Color(0xFFF5B400),
                              ),
                              Flexible(
                                child: Text(
                                  '(564 ratings)',
                                  style: kTextStyle.copyWith(
                                    color: kGreyTextColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$45',
                          style: kTextStyle.copyWith(
                            color: const Color(0xFF453D80),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Image.asset('assets/images/cancel.png'),
                              ),
                              TextSpan(
                                text: "Remove",
                                style: kTextStyle.copyWith(color: kMainColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F5F2),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Summary',
                      style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Course:',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const Spacer(),
                        Text(
                          '02',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Subtotal:',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        const Spacer(),
                        Text(
                          '\$112.99',
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Total:',
                          style: kTextStyle.copyWith(
                            color: kMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '\$112.99',
                          style: kTextStyle.copyWith(
                            color: kMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonGlobal(
            buttontext: 'Checkout',
            buttonDecoration: kButtonDecoration.copyWith(color: kMainColor),
            onPressed: () {
              const CheckoutScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
