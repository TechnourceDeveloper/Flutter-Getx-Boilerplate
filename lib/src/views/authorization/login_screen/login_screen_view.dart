import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/widgets/common_appbar_white.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/common_component.dart';
import '../../../../global/widgets/common_text.dart';
import '../../../../global/widgets/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import 'controller/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loginScreenFormKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonWhiteAppbar(
            title: "",
            isLeading: false,
            statusbarcolor: R.colors.kcPrimaryColor,
            backgroundColor: R.colors.kcPrimaryColor,
            isWhiteBack: true,
            appBar: AppBar(),
            onTap: () => Get.offNamed(Routes.welcomeScreen)),
        body: SingleChildScrollView(
            child: Container(
                // width: Get.width,
                color: R.colors.kcPrimaryColor,
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: controller.loginScreenFormKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.04),
                        CommonText(
                            text: R.strings.ksWelcomeBack.toTranslate(),
                            styleText: R.styles.txt32sizeWithW700),
                        SizedBox(height: Get.height * 0.001),
                        CommonText(
                            text: R.strings.ksGladToSeeYou.toTranslate(),
                            styleText: R.styles.txt18sizeWithW600),
                        SizedBox(height: Get.height * 0.04),
                        buildEmailField(),
                        SizedBox(height: Get.height * 0.01),
                        buildPasswordField(),
                        SizedBox(height: Get.height * 0.01),
                        forgotPasswordComponent(),
                        SizedBox(height: Get.height * 0.05),
                        CommonButton(
                            onTap: () => controller.loginValidation(),
                            color: R.colors.kcYellow,
                            height: Get.height * 0.08,
                            buttonName:
                                R.strings.ksLoginButtonText.toTranslate()),
                        SizedBox(height: Get.height * 0.03),
                        dontHaveAnAccoutComponent(),
                        SizedBox(height: Get.height * 0.05),
                        Center(child: CommonComponent().commonLogo())
                      ]),
                ))));
  }

  forgotPasswordComponent() {
    return InkWell(
        onTap: () => Get.toNamed(Routes.forgotPasswordScreen),
        child: Container(
            alignment: Alignment.topRight,
            child: CommonText(
                text: R.strings.ksForgotPassword.toTranslate(),
                styleText: R.styles.txt14sizeWithW600Underline)));
  }

  dontHaveAnAccoutComponent() {
    return Center(
        child: RichText(
            text: TextSpan(
                text: R.strings.ksDontHaveAnAccount.toTranslate(),
                style: R.styles.txt14sizeW600ckcWhite,
                children: <TextSpan>[
          TextSpan(text: " ", style: R.styles.txt14sizeWithW600),
          TextSpan(
              text: R.strings.ksSignUp.toTranslate(),
              style: R.styles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.signupScreen);
                })
        ])));
  }

  buildEmailField() {
    return AppTextField(
        isScreenTitle: true,
        hintText: R.strings.ksEmailOrPassword.toTranslate(),
        onChanged: (value) {},
        errorText: "",
        validator: Validator.validateEmail,
        textEditingController: controller.emailTextEditingController,
        keyBoardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none);
  }

  buildPasswordField() {
    return Obx(() {
      return AppTextField(
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          isPwd: controller.isShowPassword.value ? false : true,
          maxLines: 1,
          suffixIconPath: controller.isShowPassword.value
              ? R.icons.passwordHide
              : R.icons.passwordShow,
          onSuffixIconTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          onTap: () {},
          validator: Validator.passwordValid,
          textEditingController: controller.passwordTextEditingController,
          hintText: R.strings.ksPassword.toTranslate(),
          onChanged: (value) {});
    });
  }
}
