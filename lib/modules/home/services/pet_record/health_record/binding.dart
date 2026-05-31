import 'package:care_paws/modules/home/services/pet_record/health_record/controller/health_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HealthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthController>(() => HealthController());
  }
}