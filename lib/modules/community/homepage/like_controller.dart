import 'package:flutter/material.dart';

class LikeController extends ChangeNotifier {

  bool isLiked = false;
  bool showAnimation = false;

  void toggleLike() {

    isLiked = !isLiked;
    notifyListeners();
  }

  void doubleTapLike() {

    if(!isLiked){
      isLiked = true;
    }

    showAnimation = true;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 900), () {

      showAnimation = false;
      notifyListeners();

    });

  }

}