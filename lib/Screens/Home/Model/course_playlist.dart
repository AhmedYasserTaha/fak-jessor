class CoursePlaylist {
  String id, title, duration;

  CoursePlaylist({
    required this.id,
    required this.title,
    required this.duration,
  });
}

List<CoursePlaylist> playList = [
  CoursePlaylist(
    id: '1',
    title: 'Introduction To UI Design',
    duration: '10:00',
  ),
  // CoursePlaylist(id: '2', title: 'Installing Adobe XD On Windows', duration: '18:00'),
  // CoursePlaylist(id: '3', title: 'Installing Adobe XD On Mac', duration: '12:00'),
  // CoursePlaylist(id: '4', title: 'Getting Ready For The Course', duration: '08:00'),
  // CoursePlaylist(id: '5', title: 'What To Expect From The Course?', duration: '13:00'),
  // CoursePlaylist(id: '6', title: 'How To Make Designer Mindset', duration: '11:00'),
  // CoursePlaylist(id: '7', title: 'Creating a Website Project', duration: '22:00'),
  // CoursePlaylist(id: '8', title: 'Communicating With Client', duration: '28:00'),
];
