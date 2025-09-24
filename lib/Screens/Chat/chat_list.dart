// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import 'chat_inbox.dart';
import '../Home/Model/instructor_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
        backgroundColor: kMainColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        // iconTheme: const IconThemeData(color: kTitleColor),
        foregroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Chat', style: kTextStyle.copyWith(color: Colors.white)),
        // actions: [
        //   PopupMenuButton(
        //     itemBuilder: (BuildContext bc) => [
        //       PopupMenuItem(
        //         value: "/Products",
        //         child: Row(
        //           children: [
        //             const Icon(Icons.add_to_photos, color: kGreyTextColor),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 8.0),
        //               child: Text(
        //                 'Add Contact',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: AppTextField(
            //     textFieldType: TextFieldType.NAME,
            //     decoration: InputDecoration(
            //       border: outlineInputBorder(),
            //       fillColor: const Color(0xFFF7F5F2),
            //       contentPadding: const EdgeInsets.only(left: 10.0),
            //       hintText: 'Search',
            //       suffixIcon: const Icon(Icons.search, color: kTitleColor),
            //     ),
            //   ),
            // ),
            Column(
              children: instructors.asMap().entries.map((entry) {
                int index = entry.key;
                InstructorItem instructor = entry.value;
                return SettingItemWidget(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  title: instructor.instructorName.validate(),
                  // subTitle: 'Online', // Placeholder subtitle
                  leading: Image.asset(
                    'assets/${instructor.instructorPicture}',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(25),
                  // trailing: Column(
                  //   children: [
                  //     Text('10:00 AM', style: secondaryTextStyle()),
                  //   ], // Placeholder time
                  // ),
                  onTap: () {
                    ChatInbox(
                      img: 'assets/${instructor.instructorPicture}',
                      name: instructor.instructorName.validate(),
                      instructorId:
                          index, // Pass the instructor's index as an ID
                    ).launch(context);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
