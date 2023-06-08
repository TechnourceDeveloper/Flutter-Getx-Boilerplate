import 'package:flutter/services.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../src/views/authorization/reset_password/controller/reset_password_controller.dart';
import '../../src/views/authorization/signup_screen/controller/signup_screen_controller.dart';
import '../constant/resources/resources.dart';

class Validator {
  // static RegExp alphaNumberRic = RegExp(r"(?=.*\d)(?=.*[A-Za-z]).*");
  static RegExp alphaNumberRic =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static List<TextInputFormatter>? nameFormatterWithSpecialChar = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9@#\$%^&*()_-]")),
  ];

  static List<TextInputFormatter>? mobileNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[0-9-_+]"))
  ];

  static String? validateFirstName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksFirstNameError.toTranslate();
    } else if (v.length > 25) {
      return R.validation.ksValidFirstNameError.toTranslate();
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksEmailError.toTranslate();
    } else if (!GetUtils.isEmail(v.trim())) {
      return R.validation.ksValidEmail.toTranslate();
    } else {
      return null;
    }
  }



  static String? validatePassword(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksErrorPassword.toTranslate();
    } else if (!alphaNumberRic.hasMatch(v)) {
      return R.validation.ksValidPassword.toTranslate();
    } else {
      return null;
    }
  }

  static String? passwordValid(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksEmptyPassword.toTranslate();
    } else {
      return null;
    }
  }

  // change password
  static String? validateChangeNewPassword(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksErrorNewPassword.toTranslate();
    } else if (!alphaNumberRic.hasMatch(v)) {
      return R.validation.ksValidPassword.toTranslate();
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksEmptyPassword.toTranslate();
    } else if (ResetPasswordController.to.passwordController.text
        .toString()
        .trim() !=
        v.toString().trim()) {
      return R.validation.ksConfirmPassError.toTranslate();
    } else {
      return null;
    }
  }
  static String? validateSignUpConfirmPassword(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksErrorPassword.toTranslate();
    } else if (SignupScreenController.to.passwordTextEditingController.text
            .toString()
            .trim() !=
        v.toString().trim()) {
      return R.validation.ksConfirmPassError.toTranslate();
    } else {
      return null;
    }
  }


  static String? validLastName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksLastNameError.toTranslate();
    } else if (v.length > 25) {
      return R.validation.ksValidLastNameError.toTranslate();
    } else {
      return null;
    }
  }

  static String? validateUserName(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksUserNameError.toTranslate();
    } else {
      return null;
    }
  }

  static String? validNumber(String? v) {
    if (v!.isEmpty) {
      return R.validation.ksEmptyMobile.toTranslate();
    } else if (v.length < 7) {
      return R.validation.ksValidMobile.toTranslate();
    } else if (v.length > 15) {
      return R.validation.ksValidMobile.toTranslate();
    } else {
      return null;
    }
  }

  static String? validateSignUpCountryCode(String? v) {
    if (SignupScreenController.to.contactNumberController.text.length < 7 ||
        SignupScreenController.to.contactNumberController.text.length > 15) {
      return "";
    } else {
      return null;
    }
  }

  static String? validHomeAddress(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksEmptyHomeAddress.toTranslate();
    } else {
      return null;
    }
  }

  static String? validOfficeAddress(String? v) {
    if (v!.toString().trim().isEmpty) {
      return R.validation.ksEmptyOfficeAddress.toTranslate();
    } else {
      return null;
    }
  }

  static String? validOtp(String? v) {
    if (v!.length < 6) {
      return R.validation.ksEnter6DigitOpt.toTranslate();
    } else {
      return null;
    }
  }
}
