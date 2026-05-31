import 'package:get/get.dart';
import '../data/dummy_data.dart';
import '../model/pet_model.dart';

class HealthController extends GetxController {

  var pets = <Pet>[].obs;

  bool get hasData => pets.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    pets.value = DummyData.pets;
  }
}