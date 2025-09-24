// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'Model/instructor_model.dart';

class InstructorList extends StatefulWidget {
  const InstructorList({Key? key}) : super(key: key);

  @override
  _InstructorListState createState() => _InstructorListState();
}

class _InstructorListState extends State<InstructorList> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisCount: 2,
                children: List.generate(
                  instructors.length,
                  (index) => InstructorCard(instructorList: instructors[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructorCard extends StatelessWidget {
  const InstructorCard({super.key, required this.instructorList});

  final InstructorItem instructorList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// صورة دائرية
          CircleAvatar(
            backgroundColor: kMainColor.withOpacity(0.2),
            radius: 35,
            backgroundImage: AssetImage(
              'assets/${instructorList.instructorPicture}',
            ),
          ),

          4.height,

          /// الاسم
          Text(
            instructorList.instructorName,
            style: boldTextStyle(size: 14, color: kTitleColor),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          4.height,

          /// التخصص
          Text(
            instructorList.instructorCategory,
            style: secondaryTextStyle(size: 12),
            textAlign: TextAlign.center,
          ),

          4.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.people, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '${instructorList.instructorStudents} students',
                style: secondaryTextStyle(size: 12),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Icon(Icons.menu_book, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                '${instructorList.instructorCourses} courses',
                style: secondaryTextStyle(size: 12),
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// التقييم
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //   decoration: BoxDecoration(
          //     color: kMainColor.withOpacity(0.1),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       const Icon(Icons.star, color: Color(0xFFFFC107), size: 14),
          //       4.width,
          //       Text(
          //         instructorList.instructorRating,
          //         style: secondaryTextStyle(color: kTitleColor),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
