// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../constant.dart';
import 'Model/course_model.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        // ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        surfaceTintColor: Colors.white,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: GestureDetector(
        //       child: const Icon(Icons.search, color: Colors.white),
        //       // onTap: () {
        //       //   const NotificationScreen().launch(context);
        //       // },
        //     ),
        //   ),
        // ],
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'My Courses',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 0.8,
                crossAxisCount: 2,
                children: List.generate(
                  courseList.length,
                  (index) => MyCourseCard(courseList: courseList[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCourseCard extends StatelessWidget {
  const MyCourseCard({Key? key, required this.courseList}) : super(key: key);
  final CourseModel courseList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/${courseList.courseThumbnail}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseList.courseTitle,
                      style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'By ${courseList.courseInstructor}',
                      style: kTextStyle.copyWith(
                        color: kGreyTextColor,
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Completed ${courseList.courseCompleted}',
                          style: kTextStyle.copyWith(
                            color: kGreyTextColor,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        LinearPercentIndicator(
                          animation: true,
                          padding: EdgeInsets.zero,
                          lineHeight: 8.0,
                          percent: .65,
                          backgroundColor: kMainColor.withOpacity(0.2),
                          barRadius: const Radius.circular(4.0),
                          progressColor: kMainColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.star_rounded,
                    //       color: Color(0xFFF5B400),
                    //       size: 16,
                    //     ),
                    //     const SizedBox(width: 2.0),
                    //     // Text(
                    //     //   courseList.courseRating,
                    //     //   style: kTextStyle.copyWith(
                    //     //     color: kGreyTextColor,
                    //     //     fontSize: 12.0,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
