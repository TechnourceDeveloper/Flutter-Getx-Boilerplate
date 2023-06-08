
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../global/constant/resources/resources.dart';
import '../../../global/utils/utills.dart';
import '../../../global/utils/validator.dart';
import '../../../global/widgets/common_appbar_white.dart';
import '../../../global/widgets/common_button.dart';
import '../../../global/widgets/common_component.dart';
import '../../../global/widgets/custom_text_field.dart';
import 'component/user_avatar.dart';
import 'controller/edit_profile_controller.dart';

class EditProfile extends GetView<EditProfileController> {
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    controller.editProfileFormKey = GlobalKey<FormState>();

    return WillPopScope(
        onWillPop: () async {
          return await Get.offAllNamed(Routes.dashboardScreen);
        },
        child: Scaffold(
            backgroundColor: R.colors.kcWhite,
            appBar: CommonWhiteAppbar(
              appBar: AppBar(),
              backgroundColor: R.colors.kcWhite,
              title: R.strings.ksEditProfileAppbarTitle.toTranslate(),
              onTap: () {
                Get.offAllNamed(Routes.dashboardScreen);
              },
            ),
            body: SingleChildScrollView(
                child: Container(
                    color: R.colors.kcWhite,
                    child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.05),
                        child: Obx(() => Form(
                            key: controller.editProfileFormKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  UserProfile(
                                      selectedFile: controller.selectedFile,
                                      networkImg: controller.networkImg),
                                  SizedBox(height: Get.height * 0.03),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        buildFnameField(),
                                        SizedBox(width: Get.width * 0.05),
                                        buildLnameField()
                                      ]),
                                  SizedBox(height: Get.height * 0.02),
                                  buildEmailField(),
                                  SizedBox(height: Get.height * 0.02),
                                  buildUsernameField(),
                                  SizedBox(height: Get.height * 0.02),
                                  buildPhoneField(),
                                  SizedBox(height: Get.height * 0.02),
                                  buildAddressField(),
                                  SizedBox(height: Get.height * 0.02),
                                  buildOfficeAddressField(),
                                  SizedBox(height: Get.height * 0.048),
                                  buildButton(),
                                  SizedBox(height: Get.height * 0.048),
                                ]))))))));
  }

  buildAdditionalTextField(
      {required TextEditingController textController,
      required String hintText}) {
    return AppTextField(
        cursorcolor: R.colors.kcBlack,
        textStyle: R.styles.txt14sizeW500CaptionLightGray,
        textEditingController: textController,
        onChanged: (value) {
          Utils.logPrint(value);
        },
        maxLines: 4,
        hintText: hintText,
        keyBoardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.none);
  }

  buildFnameField() {
    return Expanded(
      child: AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textStyle: R.styles.ts14Fw500,
          // onFieldSubmitted: (value) {},
          hintText: R.strings.ksEditProfileNameHint.toTranslate(),
          errorText: "",
          cursorcolor: R.colors.kcGray,
          // inputFormatter: Validator.nameFormatterWithSpecialChar,
          textEditingController: controller.firstNameController,
          validator: Validator.validateFirstName,
          onChanged: (value) {},
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildLnameField() {
    return Expanded(
      child: AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textStyle: R.styles.ts14Fw500,

          // onFieldSubmitted: (value) {},
          hintText: R.strings.ksEditProfileLNameHint.toTranslate(),
          errorText: "",
          textEditingController: controller.lastNameController,
          validator: Validator.validLastName,
          cursorcolor: R.colors.kcGray,
          onChanged: (value) {},
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 2,
      ),
      child: AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textStyle: R.styles.ts14Fw500,
          // onFieldSubmitted: (value) {},
          hintText: R.strings.ksEditProfileEmailHint.toTranslate(),
          errorText: "",
          cursorcolor: R.colors.kcGray,
          textEditingController: controller.emailController,
          onChanged: (value) {},
          suffixIconPath: R.icons.icEdit,
          onSuffixIconTap: () {},
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildUsernameField() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 2,
      ),
      child: AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textStyle: R.styles.ts14Fw500,
          // onFieldSubmitted: (value) {},
          hintText:
             R.strings.ksEditProfileUserNameHint.toTranslate(),
          errorText: "",
          cursorcolor: R.colors.kcGray,
          inputFormatter: [
            FilteringTextInputFormatter.deny(RegExp('[ ]')),
          ],
          textEditingController: controller.userNameController,
          validator: Validator.validateUserName,
          onChanged: (value) {},
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildPhoneField() {
    return Padding(
        padding: const EdgeInsets.only(
          right: 2,
        ),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 22,
              child: AppTextField(
                  maxLines: 1,
                  fillColor: R.colors.kcInputFilled,
                  onTap: () {
                    controller.openCountryBottomSheet();
                  },
                  textStyle: R.styles.ts14Fw500,
                  hintText:
                      R.strings.ksEditProfileCountryCodeHint.toTranslate(),
                  errorText: "",
                  cursorcolor: R.colors.kcGray,
                  onChanged: (value) {},
                  textEditingController: controller.countryCodeController,
                  isReadOnly: true,
                  inputAction: TextInputAction.next,
                  keyBoardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none),
            ),
            SizedBox(width: Get.width * 0.03),
            Expanded(
                flex: 73,
                child: AppTextField(
                    maxLines: 1,
                    fillColor: R.colors.kcInputFilled,
                    textStyle: R.styles.ts14Fw500,
                    // onFieldSubmitted: (value) {},
                    hintText: R.strings.ksEditProfilePhoneHint.toTranslate(),
                    errorText: "",
                    cursorcolor: R.colors.kcGray,
                    textEditingController: controller.contactNumberController,
                    validator: Validator.validNumber,
                    onChanged: (value) {},
                    inputAction: TextInputAction.next,
                    keyBoardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none))
          ])
        ]));
  }

  buildAddressField() {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Obx(() => AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textEditingController: controller.homeAddressController,
          textStyle: R.styles.ts14Fw500,
          // onFieldSubmitted: (value) {},
          hintText: R.strings.ksEditProfileAddressHint.toTranslate(),
          errorText: "",
          cursorcolor: R.colors.kcGray,
          validator: Validator.validHomeAddress,
          onChanged: (value) {},
          onTap: () {
            Utils.logPrint("Tap");
          },
          suffixIconPath:  R.icons.locationIcon
          ,
          onSuffixIconTap: () {

          },
          keyBoardType: TextInputType.text,
          inputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.none)),
    );
  }

  buildOfficeAddressField() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 2,
      ),
      child: AppTextField(
          maxLines: 1,
          fillColor: R.colors.kcInputFilled,
          textStyle: R.styles.ts14Fw500,
          textEditingController: controller.officeAddressController,
          hintText: R.strings.ksEditProfileOfficeAddressHint.toTranslate(),
          errorText: "",
          cursorcolor: R.colors.kcGray,
          onChanged: (value) {
            Utils.logPrint(value);
          },
          onTap: () {

          },
          suffixIconPath:  R.icons.locationIcon
              ,
          onSuffixIconTap: () {

          },
          validator: Validator.validOfficeAddress,
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildButton() {
    return CommonButton(
        buttonName: R.strings.ksEditProfileButtonText.toTranslate(),
        color: R.colors.kcYellow,
        height: Get.height * 0.058,
        onTap: () {
          if (controller.editProfileFormKey.currentState!.validate()) {
          } else {
            Utils.errorSnackBar(
                message: R.strings.ksFillAlldetails.toTranslate());
          }
        });
  }
}
