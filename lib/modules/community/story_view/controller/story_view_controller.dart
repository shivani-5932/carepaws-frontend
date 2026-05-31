import 'dart:async';
import 'package:care_paws/modules/community/story_view/model/story_view_model.dart';


class StoryViewController {

  int currentIndex = 0;
  double progress = 0.0;
  Timer? timer;

  List<StoryViewModel> stories = [

    StoryViewModel(image: "assets/images/dog1.png", username: "pet1"),
    StoryViewModel(image: "assets/images/cat1.png", username: "pet2"),
    StoryViewModel(image: "assets/images/dog2.png", username: "pet3"),

  ];

  void startTimer(Function() onUpdate, Function() onComplete){

    timer?.cancel();

    progress = 0;

    timer = Timer.periodic(const Duration(milliseconds: 50), (timer){

      progress += 0.01;

      onUpdate();

      if(progress >= 1){
        timer.cancel();
        onComplete();
      }

    });
  }

  void dispose(){
    timer?.cancel();
  }
}