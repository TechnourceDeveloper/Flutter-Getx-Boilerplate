// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/utills.dart';
import '../../../../global/utils/validator.dart';
import '../../../../global/widgets/common_appbar_white.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/common_component.dart';
import '../../../../global/widgets/custom_text_field.dart';
import '../../../../global/widgets/vector_description_widget.dart';
import '../../../routes/app_pages.dart';
import 'controller/reset_password_controller.dart';

// ignore: must_be_immutable
class ResetPasswordView extends GetView<ResetPasswordController> {
  ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    controller.resetPwdFormKey = GlobalKey<FormState>();

    var component = CommonComponent();
    return WillPopScope(
        onWillPop: () async {
          return await Get.offAllNamed(Routes.loginScreen);
        },
        child: Scaffold(
            backgroundColor: R.colors.kcPrimaryColor,
            appBar: CommonWhiteAppbar(
                title: R.strings.ksRestorePasswordAppbarText.toTranslate(),
                style: R.styles.txt18sizeW600White,
                statusbarcolor: R.colors.kcPrimaryColor,
                backgroundColor: R.colors.kcPrimaryColor,
                appBar: AppBar(),
                isLeading: false,
                isWhiteBack: true,
                onTap: () => Get.offNamed(Routes.loginScreen)),
            body: SingleChildScrollView(
                child: Container(
                    color: R.colors.kcPrimaryColor,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                            key: controller.resetPwdFormKey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  VectorDescriptionWidget(
                                      description: R
                                          .strings.ksRestorePasswordPara
                                          .toTranslate(),
                                      imagePath:
                                          R.images.restorePasswordVector),
                                  buildPwdField(),
                                  SizedBox(height: Get.height * 0.02),
                                  buildConfirmPwdField(),
                                  SizedBox(height: Get.height * 0.04),
                                  buildButton(),
                                  SizedBox(height: Get.height * 0.03),
                                  component.commonLogo()
                                ])))))));
  }

  buildButton() {
    return CommonButton(
        onTap: () {
          Utils.logPrint("pressed........Pressed");
          controller.validAll();
        },
        color: R.colors.kcYellow,
        height: Get.height * 0.08,
        buttonName: R.strings.ksRestorePasswordButtonText.toTranslate());
  }

  buildPwdField() {
    return Obx(() {
      return Padding(
          padding: const EdgeInsets.only(
            right: 2,
          ),
          child: AppTextField(
              maxLines: 1,
              onFieldSubmitted: (value) {
                controller.confirmPwdFocusNode.requestFocus();
              },
              hintText: R.strings.ksPassword.toTranslate(),
              errorText: "",
              inputFormatter: Validator.nameFormatterWithSpecialChar,
              textEditingController: controller.passwordController,
              validator: Validator.validatePassword,
              isPwd: controller.isPwdVisible.value ? false : true,
              onChanged: (value) {
                controller.resetpwdValidation();
              },
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
          padding: const EdgeInsets.only(
            right: 2,
          ),
          child: AppTextField(
              maxLines: 1,
              focusNode: controller.confirmPwdFocusNode,
              hintText: R.strings.ksChangePasswordConfirmPassHint.toTranslate(),
              errorText: "",
              inputFormatter: Validator.nameFormatterWithSpecialChar,
              textEditingController: controller.confirmPasswordController,
              validator: Validator.validateConfirmPassword,
              isPwd: controller.isConPwdVisible.value ? false : true,
              onChanged: (value) {
                Utils.logPrint(value);
                controller.resetpwdValidation();
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
