class OnboardingModel {
  final String image;
  final String? title;
  final String? description;
  final bool isLast;

  OnboardingModel({
    required this.image,
    this.title,
    this.description,
    this.isLast = false,
  });
}