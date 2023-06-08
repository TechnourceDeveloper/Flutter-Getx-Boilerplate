import 'package:flutter/material.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/utills.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get to => Get.find();
  late GlobalKey<FormState> resetPwdFormKey;
  RxBool isBtnDisabled = true.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var confirmPwdFocusNode = FocusNode();

  RxBool isPwdVisible = false.obs, isConPwdVisible = false.obs;

  validAll() {
    if (resetPwdFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
      Get.toNamed(Routes.loginScreen);
    } else {
      Utils.logPrint("invalidate");
    }
  }

  void resetpwdValidation() async {
    resetPwdFormKey.currentState!.validate();
    if (resetPwdFormKey.currentState!.validate()) {
      Utils.logPrint("validate");
    } else {
      Utils.logPrint("invalidate");
    }
  }

  void clearTextFields() {
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
