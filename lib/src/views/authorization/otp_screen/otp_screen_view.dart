// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/utills.dart';
import '../../../../global/utils/validator.dart';
import '../../../../global/widgets/common_appbar_white.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/common_component.dart';
import '../../../../global/widgets/common_text.dart';
import '../../../../global/widgets/vector_description_widget.dart';
import '../../../routes/app_pages.dart';
import 'controller/otp_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  @override
  Widget build(BuildContext context) {
    controller.otpFormKey = GlobalKey<FormState>();
    return WillPopScope(
        onWillPop: () async {
          return await Get.offAllNamed(Routes.loginScreen);
        },
        child: Scaffold(
            backgroundColor: R.colors.kcPrimaryColor,
            appBar: CommonWhiteAppbar(
                title: R.strings.ksOTPVerification.toTranslate(),
                style: R.styles.txt18sizeW600White,
                isLeading: false,
                isWhiteBack: true,
                statusbarcolor: R.colors.kcPrimaryColor,
                backgroundColor: R.colors.kcPrimaryColor,
                appBar: AppBar(),
                onTap: () => Get.offAllNamed(Routes.loginScreen)),
            body: SingleChildScrollView(
                child: Container(
                    color: R.colors.kcPrimaryColor,
                    child: Form(
                        key: controller.otpFormKey,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: Get.width * 0.04,
                                right: Get.width * 0.04),
                            child: Column(children: [
                              VectorDescriptionWidget(
                                  description:
                                      R.strings.ksWeHaveSentAn.toTranslate(),
                                  imagePath: R.images.otpScreen),
                              SizedBox(height: Get.height * 0.03),
                              buildEnterCode(),
                              SizedBox(height: Get.height * 0.02),
                              buildPinCodeTextField(),
                              buildCodeSentText(),
                              SizedBox(height: Get.height * 0.03),
                              buildButton(),
                              SizedBox(height: Get.height * 0.03),
                              buildResendOtpText(),
                              SizedBox(height: Get.height * 0.03),
                              CommonComponent().commonLogo()
                            ])))))));
  }

  buildCodeSentText() {
    return Container(
        alignment: Alignment.topLeft,
        child: CommonText(
            text: R.strings.ksCodeHasBeenSend.toTranslate(),
            styleText: R.styles.txt14sizeW500CaptionLightGray));
  }

  buildEnterCode() {
    return Container(
        alignment: Alignment.topLeft,
        child: CommonText(
            text: R.strings.ksEnterTheCode.toTranslate(),
            styleText: R.styles.txt18sizeW600White));
  }

  buildResendOtpText() {
    return RichText(
        text: TextSpan(
            text: R.strings.ksDontReceiveTheOtp.toTranslate(),
            style: R.styles.txt14sizeW600ckcWhite,
            children: <TextSpan>[
          TextSpan(text: ' ', style: R.styles.txt14sizeW600ckcWhite),
          TextSpan(
              text: R.strings.ksResendOtp.toTranslate(),
              style: R.styles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // controller.getResendOtp();
                })
        ]));
  }

  buildButton() {
    return CommonButton(
        onTap: () {
          controller.validAll();
        },
        color: R.colors.kcYellow,
        height: Get.height * 0.08,
        buttonName: R.strings.ksVerify.toTranslate());
  }

  buildPinCodeTextField() {
    return PinCodeTextField(
        controller: controller.otpController,
        appContext: Get.context!,
        length: 6,
        errorTextDirection: TextDirection.ltr,
        obscureText: false,
        textStyle: R.styles.txt14sizeW500CaptionLightGray,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(Get.height * 0.01),
            fieldHeight: Get.height * 0.06,
            fieldWidth: Get.width * 0.13,
            activeFillColor: R.colors.kcCaptionLightGray.withOpacity(0.2),
            activeColor: R.colors.kcTransparent,
            inactiveFillColor: R.colors.kcCaptionLightGray.withOpacity(0.2),
            inactiveColor: R.colors.kcTransparent,
            selectedColor: R.colors.kcTransparent,
            selectedFillColor: R.colors.kcCaptionLightGray.withOpacity(0.2)),
        cursorColor: R.colors.kcCaptionLightGray,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        keyboardType: TextInputType.number,
        onCompleted: (v) {
          controller.otpController.text = v;
          controller.otpValidation();
          Utils.logPrint("Completed");
        },
        validator: Validator.validOtp,
        onChanged: (value) {
          Utils.logPrint("otp text field value: $value");
          controller.otpValidation();
        },
        beforeTextPaste: (text) {
          Utils.logPrint("Allowing to paste $text");
          return true;
        });
  }
}
