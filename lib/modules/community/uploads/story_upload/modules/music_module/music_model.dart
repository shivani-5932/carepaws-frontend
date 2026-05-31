class MusicModel {
  final String title;
  final String artist;
  final String previewUrl; // later use (phase 2)

  MusicModel({
    required this.title,
    required this.artist,
    this.previewUrl = "",
  });
}