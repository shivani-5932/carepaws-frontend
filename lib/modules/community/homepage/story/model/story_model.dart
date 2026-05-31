class StoryModel {

  final String image;
  final String username;
  final bool isViewed;
  final bool isAddStory;

  StoryModel({
    required this.image,
    required this.username,
    this.isViewed = false,
    this.isAddStory = false,
  });

}