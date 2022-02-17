class OnboardModel {
  String image;
  String title;
  String discription;
  OnboardModel({
    required this.image,
    required this.title,
    required this.discription,
  });
}

List<OnboardModel> contents = [
  OnboardModel(
      image: 'assets/images/doctor.png',
      title: 'Sypmptoms of Covid-19',
      discription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
  OnboardModel(
      image: 'assets/images/information.png',
      title: 'Covid-19 Information',
      discription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
  OnboardModel(
      image: 'assets/images/home.png',
      title: 'Just Stay at Home',
      discription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
];
