// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'Model/course_model.dart';
import 'Model/instructor_model.dart';
import 'course_details.dart';
import 'course_screen.dart';
import 'instructor_details.dart';
import 'instructor_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Icon(Icons.notifications, color: Colors.white),
              onTap: () {
                const NotificationScreen().launch(context);
              },
            ),
          ),
        ],
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Home',
          style: kTextStyle.copyWith(
            color: Colors.white,
            // fontWeight: FontWeight.bold,
            // fontSize: 20.0,
          ),
        ),
      ),
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card(
            //   color: Colors.white,
            //   shape: const RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(20.0),
            //       bottomRight: Radius.circular(20.0),
            //     ),
            //   ),
            //   child: SettingItemWidget(
            //     title: 'Hey Allison,',
            //     titleTextStyle: kTextStyle.copyWith(
            //       color: kTitleColor,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20.0,
            //     ),
            //     subTitle: 'Find a source you want to learn!',
            //     subTitleTextStyle: kTextStyle.copyWith(color: kGreyTextColor),
            //     trailing: GestureDetector(
            //       onTap: () {
            //         const NotificationScreen().launch(context);
            //       },
            //       child: const Image(
            //         image: AssetImage('assets/images/notific.png'),
            //       ),
            //     ).paddingRight(12),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         flex: 4,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: const Color(0xFFF7F5F2),
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //           child: AppTextField(
            //             textFieldType: TextFieldType.NAME,
            //             decoration: const InputDecoration(
            //               suffixIcon: Icon(Icons.search, color: kTitleColor),
            //               border: InputBorder.none,
            //               fillColor: Color(0xFFF7F5F2),
            //               contentPadding: EdgeInsets.all(10.0),
            //               hintText: 'Search',
            //             ),
            //           ),
            //         ),
            //       ),
            //       // const Expanded(
            //       //   flex: 1,
            //       //   child: Icon(Icons.menu, color: kMainColor),
            //       //   // Image(
            //       //   //   image: AssetImage('assets/images/filter.png'),
            //       //   // ),
            //       // ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 20.0),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            //   child: Row(
            //     children: [
            //       Text(
            //         'Categories',
            //         style: kTextStyle.copyWith(
            //           color: kTitleColor,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       const Spacer(),
            //       GestureDetector(
            //         onTap: () {
            //           const CategoryScreen().launch(context);
            //         },
            //         child: Text(
            //           'See All',
            //           style: kTextStyle.copyWith(color: kGreyTextColor),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // HorizontalList(
            //   spacing: 0,
            //   itemCount: categoryList.length,
            //   itemBuilder: (_, i) {
            //     return CategoryCard(
            //       categoryModel: categoryList[i],
            //       textPadding: 20.0,
            //     ).onTap(() {}, highlightColor: context.cardColor);
            //   },
            // ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Best Instructors',
                    style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     const InstructorList().launch(context);
                  //   },
                  //   child: Text(
                  //     'See All',
                  //     style: kTextStyle.copyWith(color: kGreyTextColor),
                  //   ),
                  // ),
                ],
              ),
            ),

            /// بدل HorizontalList بخاصية ListView.builder
            SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  0.32, // ارتفاع مناسب للكروت
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true, // لجعل القائمة تأخذ حجم محتواها
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  itemCount: instructors.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ), // تعديل المسافة بين الكروت
                      child: InstructorCard(instructorList: instructors[i])
                          .onTap(() {
                            InstructorDetailsScreen(
                              instructor: instructors[i],
                            ).launch(context);
                          }, highlightColor: context.cardColor),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Popular Courses',
                    style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     const CourseList().launch(context);
                  //   },
                  //   child: Text(
                  //     'See All',
                  //     style: kTextStyle.copyWith(color: kGreyTextColor),
                  //   ),
                  // ),
                ],
              ),
            ),

            /// بدل HorizontalList بخاصية ListView.builder
            SizedBox(
              height:
                  MediaQuery.of(context).size.height *
                  0.35, // ارتفاع مناسب للكورسات
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true, // لجعل القائمة تأخذ حجم محتواها
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  itemCount: courseList.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ), // تعديل المسافة بين الكروت
                      child: CourseCard(courseList: courseList[i]).onTap(() {
                        const CourseDetails().launch(context);
                      }, highlightColor: context.cardColor),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
