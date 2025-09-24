import 'package:flutter/material.dart';
import 'package:jessor/Screens/Home/course_details.dart';
import 'package:jessor/Screens/Home/course_screen.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../constant.dart';
import 'Model/course_model.dart';
import 'Model/instructor_model.dart';

class InstructorDetailsScreen extends StatelessWidget {
  final InstructorItem instructor;

  const InstructorDetailsScreen({Key? key, required this.instructor})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter courses by the current instructor
    final instructorCourses = courseList
        .where((course) => course.courseInstructor == instructor.instructorName)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          instructor.instructorName,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        backgroundColor: kMainColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Instructor Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/${instructor.instructorPicture}',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instructor.instructorName,
                        style: kTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kTitleColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        instructor.instructorCategory,
                        style: kTextStyle.copyWith(
                          fontSize: 16,
                          color: kGreyTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${instructor.instructorStudents} Students',
                    style: kTextStyle.copyWith(color: kTitleColor),
                  ),
                  Text(
                    '${instructor.instructorCourses} Courses',
                    style: kTextStyle.copyWith(color: kTitleColor),
                  ),
                ],
              ),
            ),
            const Divider(height: 40, thickness: 1, indent: 20, endIndent: 20),

            // Courses by this instructor
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Courses by ${instructor.instructorName}',
                style: kTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kTitleColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: instructorCourses.length,
              itemBuilder: (context, index) {
                return CourseCard(courseList: instructorCourses[index]).onTap(
                  () => const CourseDetails().launch(context),
                  highlightColor: context.cardColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
