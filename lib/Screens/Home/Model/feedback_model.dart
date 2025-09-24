class FeedbackModel {
  String studentName, studentPicture, studentRating, ratingDescription;

  FeedbackModel({required this.studentName, required this.studentPicture, required this.studentRating, required this.ratingDescription});
}

List<FeedbackModel> feedbackList = [
  FeedbackModel(
      studentName: 'Bella Hadid',
      studentPicture: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.1.jpg',
      studentRating: '(4.7)',
      ratingDescription: 'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.'),
  FeedbackModel(
      studentName: 'Chris Evans',
      studentPicture: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg',
      studentRating: '(4.5)',
      ratingDescription: 'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.'),
  FeedbackModel(
      studentName: 'Glenn Maxwell',
      studentPicture: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.3.jpg',
      studentRating: '(4.0)',
      ratingDescription: 'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.'),
  FeedbackModel(
      studentName: 'John Wick',
      studentPicture: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.4.jpg',
      studentRating: '(4.2)',
      ratingDescription: 'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.'),
  FeedbackModel(
      studentName: 'Gal Gadot',
      studentPicture: 'https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.5.jpg',
      studentRating: '(4.9)',
      ratingDescription: 'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time.'),
];
