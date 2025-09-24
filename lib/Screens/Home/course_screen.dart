// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'Model/course_model.dart';
import 'course_details.dart';

class CourseList extends StatefulWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

const double width = 300.0;
const double height = 60.0;
const double loginAlign = -1;
const double signInAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = kTitleColor;

class _CourseListState extends State<CourseList> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;

  @override
  void initState() {
    super.initState();

    xAlign = loginAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
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
          'All Courses',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => const NotificationScreen().launch(context),
              child: const Icon(FontAwesomeIcons.search),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final toggleWidth = constraints.maxWidth > 300.0
                      ? 300.0
                      : constraints.maxWidth * 0.9;
                  return Container(
                    width: toggleWidth,
                    height: height,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(xAlign, 0),
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: toggleWidth * 0.5,
                            height: height,
                            decoration: const BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = loginAlign;
                              loginColor = selectedColor;

                              signInColor = normalColor;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(-1, 0),
                            child: Container(
                              width: toggleWidth * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'Most Popular',
                                style: TextStyle(
                                  color: loginColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              xAlign = signInAlign;
                              signInColor = selectedColor;

                              loginColor = normalColor;
                            });
                          },
                          child: Align(
                            alignment: const Alignment(1, 0),
                            child: Container(
                              width: toggleWidth * 0.5,
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Text(
                                'Trending',
                                style: TextStyle(
                                  color: signInColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
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
                  (index) => CourseCard(courseList: courseList[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({Key? key, required this.courseList}) : super(key: key);
  final CourseModel courseList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => const CourseDetails().launch(context),
        child: Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/${courseList.courseThumbnail}',
                    width: 180,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   right: 0.0,
                  //   bottom: 0.0,
                  //   child: Container(
                  //     width: 50.0,
                  //     height: 30.0,
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(20.0),
                  //         bottomLeft: Radius.circular(20.0),
                  //       ),
                  //       color: kMainColor,
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         // courseList.coursePrice,
                  //         style: kTextStyle.copyWith(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  courseList.courseTitle,
                  style: kTextStyle.copyWith(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'By ${courseList.courseInstructor}',
                  style: kTextStyle.copyWith(
                    color: kGreyTextColor,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: kMainColor,
                      radius: 10,
                      child: Center(
                        child: Icon(
                          Icons.playlist_play_rounded,
                          color: Colors.white,
                          size: 12.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 15.0),
                      child: Text(
                        '${courseList.courseTutorial} Tutorial',
                        style: kTextStyle.copyWith(
                          color: kGreyTextColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    // const Icon(Icons.star_rounded, color: Color(0xFFF5B400)),
                    // Text(
                    //   courseList.courseRating,
                    //   style: kTextStyle.copyWith(
                    //     color: kGreyTextColor,
                    //     fontSize: 12.0,
                    //   ),
                    // ),
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
