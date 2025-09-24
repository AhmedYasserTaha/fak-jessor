// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../constant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
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
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Notification',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        // actions: [
        //   PopupMenuButton(
        //     icon: const Icon(Icons.more_vert, color: Colors.white),
        //     itemBuilder: (BuildContext bc) => [
        //       PopupMenuItem(
        //         value: "/Products",
        //         child: Row(
        //           children: [
        //             const Icon(Icons.add_to_photos, color: kGreyTextColor),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 8.0),
        //               child: Text(
        //                 'Mark all as Read',
        //                 style: GoogleFonts.poppins(
        //                   fontSize: 18.0,
        //                   color: Colors.black,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //     onSelected: (value) {
        //       Navigator.pushNamed(context, '$value');
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: Text(
          'لا توجد إشعارات حاليًا',
          style: kTextStyle.copyWith(color: kGreyTextColor, fontSize: 18.0),
        ),
      ),
    );
  }
}
