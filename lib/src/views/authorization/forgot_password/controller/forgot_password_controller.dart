import 'package:flutter/material.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/utills.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();
  late GlobalKey<FormState> forgotPwdFormKey;
  var emailController = TextEditingController();

  validAll() {
    if (forgotPwdFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
      Get.toNamed(Routes.otpScreen);
    } else {
      Utils.logPrint("invalidate");
    }
  }

  void forgetValidation() async {
    forgotPwdFormKey.currentState!.validate();
    if (forgotPwdFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
    } else {
      Utils.logPrint("invalidate");
    }
  }
}
