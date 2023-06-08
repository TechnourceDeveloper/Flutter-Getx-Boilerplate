import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/component/country_code.dart';
import '../../../../global/component/country_item.dart';
import '../../../../global/utils/utills.dart';

class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  Rx<File> selectedFile = File("").obs;
  RxString networkImg = "".obs;
  RxBool isBtnDisabled = true.obs;

  late GlobalKey<FormState> editProfileFormKey;

  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var contactNumberController = TextEditingController();
  var countryCodeController = TextEditingController();
  var userNameController = TextEditingController();
  var homeAddressController = TextEditingController();
  var officeAddressController = TextEditingController();

  var countryList = <CountryItem>[].obs;
  Rx<CountryItem> selectedCont = CountryItem().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    countryList.addAll(getCountryList().data!);
  }

  void editProfileValidation() async {
    if (editProfileFormKey.currentState!.validate()) {
      editProfileFormKey.currentState!.save();
      isBtnDisabled.value = false;
    } else {
      isBtnDisabled.value = true;
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
