// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'Model/course_playlist.dart';
import 'Model/feedback_model.dart';
import 'my_courses.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

const double width = 300.0;
const double height = 50.0;
const double playListAlign = -1;
const double descriptionAlign = 1;
const Color selectedColor = Colors.white;
const Color normalColor = kTitleColor;

class _CourseDetailsState extends State<CourseDetails> {
  late double xAlign;
  late Color loginColor;
  late Color signInColor;
  bool descriptionShow = false;
  List<String> faqData = [
    'Can i enroll single class?',
    'What is fund pocily',
    'Is financial aid available?',
    'What tool i need?',
  ];
  String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  @override
  void initState() {
    super.initState();

    xAlign = playListAlign;
    loginColor = selectedColor;
    signInColor = normalColor;
  }

  bool isExpanded = false;

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        foregroundColor: Colors.white,

        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: kMainColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Details', style: kTextStyle.copyWith(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                const NotificationScreen().launch(context);
              },
              child: const Icon(Icons.notifications_none, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    // const MyCourses().launch(context, isNewTask: true);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const MyCourses();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 55.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: kMainColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Enroll Now',
                            style: kTextStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/coursethumbnail1.png',
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                  fit: BoxFit.cover,
                ),
                // Positioned(
                //   right: 0.0,
                //   bottom: 0.0,
                //   child: Container(
                //     width: 80.0,
                //     height: 40.0,
                //     decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20.0),
                //         bottomLeft: Radius.circular(20.0),
                //       ),
                //       color: Color(0xFF453D80),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Free',
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
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
              ),
              child: Row(
                children: [
                  Text(
                    'User Interface Design ',
                    style: kTextStyle.copyWith(
                      color: kTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 20.0,
            //     right: 20.0,
            //     top: 10.0,
            //   ),
            //   child: Row(
            //     children: [
            //       Text(
            //         'By Talent Tamer',
            //         style: kTextStyle.copyWith(color: kGreyTextColor),
            //       ),
            //       const Spacer(),
            //       Text(
            //         '8h 30 min - 27 Tutorials',
            //         style: kTextStyle.copyWith(color: kGreyTextColor),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 20.0),
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
                              xAlign = playListAlign;
                              loginColor = selectedColor;
                              descriptionShow = false;
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
                                'Playlist',
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
                              xAlign = descriptionAlign;
                              signInColor = selectedColor;
                              descriptionShow = true;
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
                                'Description',
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
            Visibility(
              visible: descriptionShow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                          maxLines: isExpanded ? 2 : 100,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? 'Read more' : 'Read less',
                            style: const TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'What you\'ll get',
                          style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.library_books_outlined,
                              color: kMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              '27 Lesson',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.desktop_mac_sharp,
                              color: kMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Access on Mobile & Desktop',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.bar_chart,
                              color: kMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Begginer Level',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: kMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Lifetime Access',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                        Row(
                          children: [
                            const Icon(Icons.quiz, color: kMainColor, size: 18),
                            const SizedBox(width: 10.0),
                            Text(
                              '100 Quiz',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                        Row(
                          children: [
                            const Icon(
                              Icons.contact_page_outlined,
                              color: kMainColor,
                              size: 18,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Certificate of Completion',
                              style: kTextStyle.copyWith(color: kGreyTextColor),
                            ),
                          ],
                        ).paddingBottom(8),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'FAQ',
                          style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: faqData.map((data) {
                        return ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          title: Text(
                            data.validate(),
                            style: primaryTextStyle(),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                description,
                                style: secondaryTextStyle(),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Student\'s Feedback',
                          style: kTextStyle.copyWith(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalList(
                    spacing: 0,
                    itemCount: feedbackList.length,
                    itemBuilder: (_, i) {
                      return FeedbackCard(feedbackModel: feedbackList[i]).onTap(
                        () {
                          const CourseDetails().launch(context);
                        },
                        highlightColor: context.cardColor,
                      );
                    },
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !descriptionShow,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: playList.length,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                shrinkWrap: true,
                itemBuilder: (context, i) =>
                    PlaylistCard(playlist: playList[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({Key? key, required this.feedbackModel}) : super(key: key);
  final FeedbackModel feedbackModel;

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFF7F5F2),
        ),
        child: Column(
          children: [
            SettingItemWidget(
              title: widget.feedbackModel.studentName,
              subTitle: widget.feedbackModel.studentRating,
              titleTextStyle: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
              ),
              subTitleTextStyle: kTextStyle.copyWith(color: kTitleColor),
              leading: Image.network(
                widget.feedbackModel.studentPicture,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(25),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.feedbackModel.ratingDescription,
                    maxLines: isExpanded ? 2 : 100,
                    overflow: TextOverflow.ellipsis,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      isExpanded ? 'Read more' : 'Read less',
                      style: const TextStyle(
                        color: kMainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({Key? key, required this.playlist}) : super(key: key);
  final CoursePlaylist playlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFFF7F5F2),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFFF0EEED),
            child: Center(
              child: Text(
                playlist.id,
                style: kTextStyle.copyWith(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            playlist.title,
            style: kTextStyle.copyWith(
              color: kTitleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '00.00 / ${playlist.duration}',
            style: kTextStyle.copyWith(color: kGreyTextColor),
          ),
          trailing: GestureDetector(
            onTap: () async {
              final url = Uri.parse(
                'https://youtu.be/55NvZjUZIO8?si=uvWZf3OMXtMdusCN',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: const CircleAvatar(
              backgroundColor: Color(0xFFFBECD9),
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: kMainColor,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
