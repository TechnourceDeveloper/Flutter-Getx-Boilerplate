import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/utills.dart';

class OtpScreenController extends GetxController {
  TextEditingController otpController = TextEditingController();
  late GlobalKey<FormState> otpFormKey;



  validAll() {
    if (otpFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
      Get.toNamed(Routes.resetPasswordScreen);
    } else {
      Utils.logPrint("invalidate");
    }
  }

  void otpValidation() async {
    otpFormKey.currentState!.validate();
    if (otpFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
    } else {
      Utils.logPrint("invalidate");
    }
  }
}
