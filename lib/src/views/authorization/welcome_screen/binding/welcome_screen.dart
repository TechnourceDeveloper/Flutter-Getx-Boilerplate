import 'package:get/get.dart';

import '../controller/welcome_screen_controller.dart';

class WelcomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeScreenController>(() => WelcomeScreenController());
  }
}
