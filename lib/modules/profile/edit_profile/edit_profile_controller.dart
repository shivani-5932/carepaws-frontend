import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var name = "".obs;
  var phone = "".obs;
  var email = "".obs;
  var dob = "".obs;

  void saveProfile() {
    // API / Firebase call later
    print("Saved");
  }
}