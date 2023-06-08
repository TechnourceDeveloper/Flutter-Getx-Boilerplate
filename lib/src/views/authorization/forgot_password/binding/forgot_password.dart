import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }

}