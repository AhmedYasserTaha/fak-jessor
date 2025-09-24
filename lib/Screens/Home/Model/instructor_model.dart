class InstructorItem {
  String instructorName,
      instructorPicture,
      instructorCategory,
      instructorStudents,
      instructorCourses;
  // instructorRating;

  InstructorItem({
    required this.instructorName,
    required this.instructorPicture,
    required this.instructorCategory,
    required this.instructorStudents,
    required this.instructorCourses,
    // required this.instructorRating,
  });
}

List<InstructorItem> instructors = [
  InstructorItem(
    instructorName: 'Ahmed Ali',
    instructorPicture: 'images/instructor1.png',
    instructorCategory: 'Graphic Design',
    instructorStudents: '20',
    instructorCourses: '1',
    // instructorRating: '(4.5)',
  ),
  // InstructorItem(
  //   instructorName: 'Fatima Zahra',
  //   instructorPicture: 'images/instructor2.png',
  //   instructorCategory: 'Graphic Design',
  //   instructorStudents: '80k',
  //   instructorCourses: '32',
  //   instructorRating: '(4.5)',
  // ),
  // InstructorItem(
  //   instructorName: 'Omar Sharif',
  //   instructorPicture: 'images/instructor3.png',
  //   instructorCategory: 'Health',
  //   instructorStudents: '40k',
  //   instructorCourses: '27',
  //   instructorRating: '(4.5)',
  // ),
  // InstructorItem(
  //   instructorName: 'Khalid Ibrahim',
  //   instructorPicture: 'images/instructor4.png',
  //   instructorCategory: 'Lifestyle',
  //   instructorStudents: '20k',
  //   instructorCourses: '17',
  //   instructorRating: '(4.5)',
  // ),
  // InstructorItem(
  //   instructorName: 'Laila Hassan',
  //   instructorPicture: 'images/instructor5.png',
  //   instructorCategory: 'Photography',
  //   instructorStudents: '20k',
  //   instructorCourses: '14',
  //   instructorRating: '(4.6)',
  // ),
  // InstructorItem(
  //   instructorName: 'Nour Tarek',
  //   instructorPicture: 'images/instructor6.png',
  //   instructorCategory: 'Programming',
  //   instructorStudents: '70k',
  //   instructorCourses: '23',
  //   instructorRating: '(4.3)',
  // ),
  // // InstructorItem(
  //   instructorName: 'Wade Warren',
  //   instructorPicture: 'images/instructor7.png',
  //   instructorCategory: 'Music',
  //   instructorStudents: '30k',
  //   instructorCourses: '19',
  //   instructorRating: '(4.9)',
  // ),
  // InstructorItem(
  // instructorName: 'Arlene McCoy',
  // instructorPicture: 'images/instructor8.png',
  // instructorCategory: 'Marketing',
  // instructorStudents: '10k',
  // instructorCourses: '12',
  // instructorRating: '(4.8)'),
];
