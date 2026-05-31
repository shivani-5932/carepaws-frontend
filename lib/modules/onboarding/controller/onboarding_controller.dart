import 'dart:async';
import 'package:care_paws/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  Timer? _timer;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding/onboard1.png',
      title: 'Smart Care For Your Pet’s Health',
      description:
      'Consult trusted vets, track health records, manage vaccination and get diet recommendations tailored to your pet',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboard2.png',
      title: 'Together We Can Rescue More',
      description:
      'Report injured or needy street pets, nearby members and volunteers can step into help instantly',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboard3.png',
      title: 'A Community Caring For Every Pet',
      description:
      'Connect with pet lovers around you, share stories, seek help and build a safe space for every pet owned or stray',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboard4.png',
      title: 'Celebrate Every Paw Moment',
      description:
      'Discover pet shows, adoption drives, and community events, let your pet shine and be part of something bigger',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding/onboard5.png',
      isLast: true,
    ),
  ];

  void startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex < pages.length - 2) {
        nextPage();
      } else {
        timer.cancel();
      }
    });
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onGetStarted(BuildContext context) {
    // Navigator.pushReplacementNamed(context, AppRoutes.login);
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}