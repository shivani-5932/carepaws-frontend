import 'dart:async';

class HomeController {

  int currentIndex = 0;
  Timer? timer;

  final List<String> images = [
    "assets/images/carousel/1.png",
    "assets/images/carousel/2.png",
    "assets/images/carousel/3.png",
    "assets/images/carousel/4.png",
  ];

  void startAutoSlide(Function update){

    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 3), (timer){

      currentIndex = (currentIndex + 1) % images.length;
      update();

    });
  }

  void dispose(){
    timer?.cancel();
  }
}