import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 1.obs; // default community

  NavigationController() {
    print("CONTROLLER CREATED");
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    print("INDEX: $index");
  }

  bool get isCommunitySelected =>
      selectedIndex.value == 1 ||
          selectedIndex.value == 2 ||
          selectedIndex.value == 3;
}