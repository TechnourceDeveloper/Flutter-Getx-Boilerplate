import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/config.dart';
import '../../../../global/utils/utills.dart';
import '../../../../global/utils/validator.dart';
import '../../../../global/widgets/custom_text_field.dart';
import '../../../../global/widgets/common_appbar_white.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/common_component.dart';
import '../../../../global/widgets/common_text.dart';
import '../../../routes/app_pages.dart';
import 'controller/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  const SignupScreenView({super.key});


  @override
  Widget build(BuildContext context) {
    controller.createAccountFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        appBar: CommonWhiteAppbar(
            title: "",
            isWhiteBack: true,
            statusbarcolor: R.colors.kcPrimaryColor,
            backgroundColor: R.colors.kcPrimaryColor,
            appBar: AppBar(),
            onTap: () => Get.offNamed(Routes.welcomeScreen)),
        body: SingleChildScrollView(
            child: Container(
                color: R.colors.kcPrimaryColor,
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Form(
                    key: controller.createAccountFormKey,
                    child: Obx(() {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: Get.height * 0.045),
                            CommonText(
                                text:

                                R.strings.ksWelcomeToTechnource.toTranslate(),

                                styleText: R.styles.txt32sizeWithW700),
                            SizedBox(height: Get.height * 0.001),
                            CommonText(
                                text:
                                R.strings.ksCreateNewAccount.toTranslate(),
                                styleText: R.styles.txt18sizeWithW600),
                            SizedBox(height: Get.height * 0.04),
                            buildFirstnameField(),
                            SizedBox(height: Get.height * 0.02),
                            buildLastnameField(),
                            SizedBox(height: Get.height * 0.02),
                            buildEmailField(),
                            SizedBox(height: Get.height * 0.02),
                            buildUsernameField(),
                            SizedBox(height: Get.height * 0.02),
                            buildPhoneField(),
                            SizedBox(height: Get.height * 0.02),
                            buildPwdField(),
                            SizedBox(height: Get.height * 0.02),
                            buildConfirmPwdField(),
                            SizedBox(height: Get.height * 0.02),
                            buildAcceptTermsConditions(),
                            SizedBox(height: Get.height * 0.04),
                            buildSignupButton(),
                            SizedBox(height: Get.height * 0.04),
                            alreadyHaveAnAccoutComponent(),
                            SizedBox(height: Get.height * 0.03),
                            CommonComponent().commonLogo()
                          ]);
                    })))));
  }

  buildAcceptTermsConditions() {
    return Row(children: [
      checkBox(checkboxValue: controller.termAndConditionCheckBox),
      SizedBox(width: Get.width * 0.01),
      bySigningUpYouComponent()
    ]);
  }

  buildSignupButton() {
    return CommonButton(
        onTap: () {
          controller.validAll();
        },
        color: R.colors.kcYellow,
        height: Get.height * 0.08,
        buttonName: R.strings.ksSignup.toTranslate());
  }

  alreadyHaveAnAccoutComponent() {
    return Center(
        child: RichText(
            text: TextSpan(
                text: R.strings.ksAlreadyHaveAnAccount.toTranslate(),
                style: R.styles.txt14sizeW600ckcWhite,
                children: <TextSpan>[
                  TextSpan(text: " ", style: R.styles.txt14sizeWithW600),
                  TextSpan(
                      text: R.strings.ksLogin.toTranslate(),
                      style: R.styles.txt14sizeWithW600Underline,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.loginScreen);
                        })
                ])));
  }

  checkBox({required RxBool checkboxValue}) {
    return SizedBox(
        width: 22,
        height: 22,
        child: Obx(() =>
            Checkbox(
                value: checkboxValue.value,
                onChanged: (value) {
                  checkboxValue.value = !checkboxValue.value;
                  controller.isAcceptPolicy.value = checkboxValue.value;
                },
                activeColor: R.colors.kcPrimaryColor,
                side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                        BorderSide(width: 1.0, color: R.colors.kcWhite)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)))));
  }

  bySigningUpYouComponent() {
    return Flexible(
        child: RichText(
            text: TextSpan(
                text: R.strings.ksBySigningUpYou.toTranslate(),
                style: R.styles.txt10sizeWithW500,
                children: <TextSpan>[
                  TextSpan(text: " ", style: R.styles.txt10sizeWithW500),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.termsPrivacyScreen,
                              arguments: [Config.cmsTermsCondition]);
                        },
                      text: R.strings.ksTermsAndConditions.toTranslate(),
                      style: R.styles.txt10sizeWithW500Underline),
                  TextSpan(text: " ", style: R.styles.txt10sizeWithW500),
                  TextSpan(
                      text: R.strings.ksAnd.toTranslate(),
                      style: R.styles.txt10sizeWithW500),
                  TextSpan(text: " ", style: R.styles.txt10sizeWithW500),
                  TextSpan(
                      text: R.strings.ksPrivacyPolicy.toTranslate(),
                      style: R.styles.txt10sizeWithW500Underline,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.termsPrivacyScreen,
                              arguments: [Config.cmsPrivacyPolicy]);
                        })
                ])));
  }

  buildFirstnameField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: R.colors.kcInputFilled,
            cursorcolor: R.colors.kcWhite,
            textStyle: R.styles.txt14sizeW600ckcWhite,
            hintText: R.strings.ksEditProfileNameHint.toTranslate(),
            errorText: "",
            textEditingController: controller.firstNameTextEditingController,
            validator: Validator.validateFirstName,
            onChanged: (value) {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.sentences));
  }

  buildLastnameField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: R.colors.kcInputFilled,
            hintText: R.strings.ksEditProfileLNameHint.toTranslate(),
            errorText: "",
            textEditingController: controller.lastNameTextEditingController,
            validator: Validator.validLastName,
            cursorcolor: R.colors.kcWhite,
            textStyle: R.styles.txt14sizeW600ckcWhite,
            onChanged: (value) {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.none));
  }

  buildEmailField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            isReadOnly: controller.isRedOnlyEmail.value,
            maxLines: 1,
            fillColor: R.colors.kcInputFilled,
            cursorcolor: R.colors.kcWhite,
            textStyle: R.styles.txt14sizeW600ckcWhite,
            hintText: R.strings.ksEditProfileEmailHint.toTranslate(),
            errorText: "",
            validator: Validator.validateEmail,
            onChanged: (value) {},
            textEditingController: controller.emailTextEditingController,
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none));
  }

  buildUsernameField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: R.colors.kcInputFilled,
            hintText: R.strings.ksEditProfileUserNameHint.toTranslate(),
            errorText: "",
            cursorcolor: R.colors.kcWhite,
            textStyle: R.styles.txt14sizeW600ckcWhite,
            inputFormatter: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
            ],
            textEditingController: controller.usernameTextEditingController,
            validator: Validator.validateUserName,
            onChanged: (value) {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.none));
  }

  buildPhoneField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 22,
              child: AppTextField(
                  maxLines: 1,
                  fillColor: R.colors.kcInputFilled,
                  onTap: () {
                    controller.openCountryBottomSheet();
                  },
                  validator: !controller.isCountryApiCalled.value
                      ? null
                      : Validator.validateSignUpCountryCode,
                  hintText:
                  R.strings.ksEditProfileCountryCodeHint.toTranslate(),
                  errorText: "",
                  cursorcolor: R.colors.kcWhite,
                  textStyle: R.styles.txt14sizeW600ckcWhite,
                  onChanged: (value) {},
                  textEditingController: controller.countryCodeController,
                  isReadOnly: true,
                  inputAction: TextInputAction.next,
                  keyBoardType: TextInputType.number,
                  textCapitalization: TextCapitalization.none)),
          SizedBox(width: Get.width * 0.03),
          Expanded(
              flex: 73,
              child: AppTextField(
                  maxLines: 1,
                  inputFormatter: Validator.mobileNumberFormatter,
                  fillColor: R.colors.kcInputFilled,
                  // onFieldSubmitted: (value) {},
                  hintText: R.strings.ksEditProfilePhoneHint.toTranslate(),
                  errorText: "",
                  cursorcolor: R.colors.kcWhite,
                  textStyle: R.styles.txt14sizeW600ckcWhite,
                  textEditingController: controller.contactNumberController,
                  validator: Validator.validNumber,
                  maxLength: 15,
                  onChanged: (value) {},
                  inputAction: TextInputAction.next,
                  keyBoardType: TextInputType.phone,
                  textCapitalization: TextCapitalization.none))
        ]));
  }

  buildPwdField() {
    return Obx(() {
      return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: AppTextField(
              maxLines: 1,
              hintText: R.strings.ksChangePasswordNewPassHint.toTranslate(),
              errorText: "",
              inputFormatter: Validator.nameFormatterWithSpecialChar,
              textEditingController: controller.passwordTextEditingController,
              validator: Validator.validateChangeNewPassword,
              isPwd: controller.isPwdVisible.value ? false : true,
              onChanged: (value) {},
              cursorcolor: R.colors.kcWhite,
              textStyle: R.styles.txt14sizeW600ckcWhite,
              suffixIconPath: controller.isPwdVisible.value
                  ? R.icons.passwordHide
                  : R.icons.passwordShow,
              onSuffixIconTap: () {
                controller.isPwdVisible.value = !controller.isPwdVisible.value;
              },
              inputAction: TextInputAction.next,
              keyBoardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none));
    });
  }

  buildConfirmPwdField() {
    return Obx(() {
      return Padding(
          padding: const EdgeInsets.only(right: 2),
          child: AppTextField(
              maxLines: 1,
              cursorcolor: R.colors.kcWhite,
              textStyle: R.styles.txt14sizeW600ckcWhite,
              hintText: R.strings.ksChangePasswordConfirmPassHint.toTranslate(),
              errorText: "",
              inputFormatter: Validator.nameFormatterWithSpecialChar,
              textEditingController:
              controller.confirmPasswordTextEditingController,
              validator: Validator.validateSignUpConfirmPassword,
              isPwd: controller.isConPwdVisible.value ? false : true,
              onChanged: (value) {
                Utils.logPrint(value);
              },
              suffixIconPath: controller.isConPwdVisible.value
                  ? R.icons.passwordHide
                  : R.icons.passwordShow,
              onSuffixIconTap: () {
                controller.isConPwdVisible.value =
                !controller.isConPwdVisible.value;
              },
              inputAction: TextInputAction.done,
              keyBoardType: TextInputType.visiblePassword,
              textCapitalization: TextCapitalization.none));
    });
  }
}
