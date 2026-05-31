import 'package:flutter/material.dart';
import '../controller/home_controller.dart';

class HomeCarouselWidget extends StatefulWidget {
  const HomeCarouselWidget({super.key});

  @override
  State<HomeCarouselWidget> createState() => _HomeCarouselWidgetState();
}

class _HomeCarouselWidgetState extends State<HomeCarouselWidget> {

  final HomeController controller = HomeController();

  /// 🔥 infinite start
  final PageController pageController = PageController(initialPage: 1000);

  int currentPage = 1000;

  @override
  void initState() {
    super.initState();
    autoSlide();
  }

  /// 🔥 one direction infinite slide
  void autoSlide() {

    Future.delayed(const Duration(seconds: 3), () {

      if (!mounted) return;

      currentPage++;

      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

      autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {

    return ClipPath(
      clipper: BottomCurveClipper(),

      child: SizedBox(
        height: 200,

        child: PageView.builder(

          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),

          itemBuilder: (context, index) {

            /// 🔥 map infinite index to real images
            final realIndex = index % controller.images.length;

            return Image.asset(
              controller.images[realIndex],
              fit: BoxFit.cover,
              width: double.infinity,

              /// safety (optional)
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.error));
              },
            );
          },
        ),
      ),
    );
  }
}


/// 🔥 DEEP CURVE (exact UI feel)
class BottomCurveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    Path path = Path();

    path.lineTo(0, size.height - 70);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40, // deeper curve
      size.width,
      size.height - 70,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}