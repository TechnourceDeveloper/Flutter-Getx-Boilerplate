
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/global/utils/utills.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';

import 'package:get/get.dart';

import '../../../../../global/component/country_code.dart';
import '../../../../../global/component/country_item.dart';
import '../../../../../global/constant/resources/resources.dart';

class SignupScreenController extends GetxController {
  static SignupScreenController get to => Get.put(SignupScreenController());
  RxBool termAndConditionCheckBox = false.obs,
      isRedOnlyEmail = false.obs,
      isAcceptPolicy = false.obs,
      isPwdVisible = false.obs,
      isConPwdVisible = false.obs,
      isCountryApiCalled = true.obs;
  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  String accessTokenFB = "", fbId = "", emailIdFB = "", gmailId = "";

  late GlobalKey<FormState> forContactNumberUi;
  late GlobalKey<FormState> createAccountFormKey;
  var firstNameTextEditingController = TextEditingController(),
      lastNameTextEditingController = TextEditingController(),
      emailTextEditingController = TextEditingController(),
      usernameTextEditingController = TextEditingController(),
      passwordTextEditingController = TextEditingController(),
      confirmPasswordTextEditingController = TextEditingController(),
      countryCodeController = TextEditingController(),
      contactNumberController = TextEditingController();

  var contactNumberFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    countryCodeController.text = "+32";
  }

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  validAll() {
    if (createAccountFormKey.currentState!.validate()) {
      debugPrint("validate");

      if (isAcceptPolicy.value == true) {
        Get.offAllNamed(Routes.loginScreen);
      } else {
        debugPrint("in Else");
        Utils.errorSnackBar(
          message: R.strings.ksAcceptTermAndConditionError.toTranslate(),
        );
      }
    } else {
      debugPrint("Invalidate");
    }
  }

  void openCountryBottomSheet() {
    CountryCodePicker.openCountryBottomSheet(
        countrys: countryList,
        onSelect: (country) {
          countryCodeController.text = "+${country.phoneCode!}";
          selectedCont.value = country;
        });
  }
}
