class StoryViewModel {

  final String image;
  final String username;
  final bool isSeen;

  StoryViewModel({
    required this.image,
    required this.username,
    this.isSeen = false,
  });

}