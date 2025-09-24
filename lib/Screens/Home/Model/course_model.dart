class CourseModel {
  String courseTitle,
      courseDuration,
      courseInstructor,
      // coursePrice,
      courseTutorial,
      courseCategory,
      courseThumbnail,
      courseCompleted;
  // courseRating;

  CourseModel({
    required this.courseTitle,
    required this.courseDuration,
    required this.courseInstructor,
    // required this.coursePrice,
    required this.courseTutorial,
    required this.courseCategory,
    required this.courseThumbnail,
    required this.courseCompleted,
    // required this.courseRating,
  });
}

List<CourseModel> courseList = [
  CourseModel(
    courseTitle: 'User Interface Design',
    courseDuration: '8h 30 min',
    courseInstructor: 'Ahmed Ali',
    // coursePrice: 'Free', // Already Free, no change needed.
    courseTutorial: '1',
    courseCategory: 'Graphics Design',
    courseThumbnail: 'images/coursethumbnail1.png',
    courseCompleted: '89%',
    // courseRating: '4.9',
  ),
  // CourseModel(
  //   courseTitle: 'Android App Design',
  //   courseDuration: '8h 30 min',
  //   courseInstructor: 'Jenny Wilson',
  //   coursePrice: 'Free', // Changed to Free
  //   courseTutorial: '1',
  //   courseCategory: 'Development',
  //   courseThumbnail: 'images/coursethumbnail1.png',
  //   courseCompleted: '89%',
  //   courseRating: '4.6',
  // ),
  // CourseModel(
  //   courseTitle: 'Android App Design',
  //   courseDuration: '8h 30 min',
  //   courseInstructor: 'Jenny Wilson',
  //   coursePrice: 'Free', // Changed to Free
  //   courseTutorial: '29',
  //   courseCategory: 'Development',
  //   courseThumbnail: 'images/coursethumbnail1.png',
  //   courseCompleted: '89%',
  //   courseRating: '4.6',
  // ),
  // CourseModel(
  //   courseTitle: 'Android App Design',
  //   courseDuration: '8h 30 min',
  //   courseInstructor: 'Jenny Wilson',
  //   coursePrice: 'Free', // Changed to Free
  //   courseTutorial: '29',
  //   courseCategory: 'Development',
  //   courseThumbnail: 'images/coursethumbnail1.png',
  //   courseCompleted: '89%',
  //   courseRating: '4.6',
  // ),
  // CourseModel(
  //   courseTitle: 'Android App Design',
  //   courseDuration: '8h 30 min',
  //   courseInstructor: 'Jenny Wilson',
  //   coursePrice: 'Free', // Changed to Free
  //   courseTutorial: '29',
  //   courseCategory: 'Development',
  //   courseThumbnail: 'images/coursethumbnail1.png',
  //   courseCompleted: '89%',
  //   courseRating: '4.6',
  // ),
  // CourseModel(
  // courseTitle: 'Android App Design',
  //   courseDuration: '8h 30 min',
  //   courseInstructor: 'Jenny Wilson',
  //   coursePrice: 'Free', // Changed to Free
  //   courseTutorial: '29',
  //   courseCategory: 'Development',
  //   courseThumbnail: 'images/coursethumbnail1.png',
  //   courseCompleted: '89%',
  //   courseRating: '4.6',
  // ),
];
