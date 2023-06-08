import 'package:get/get.dart';

import '../controller/otp_controller.dart';


class OtpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OtpScreenController>(() => OtpScreenController());
  }

}