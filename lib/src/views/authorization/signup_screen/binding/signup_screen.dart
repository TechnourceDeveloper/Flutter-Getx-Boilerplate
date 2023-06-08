import 'package:flutter_setup/src/views/authorization/signup_screen/controller/signup_screen_controller.dart';
import 'package:get/get.dart';

class SignupScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignupScreenController>(() => SignupScreenController());
  }
}