import 'package:life_point_empleado/controllers/controllers.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
