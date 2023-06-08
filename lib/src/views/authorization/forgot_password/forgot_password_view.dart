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
import 'controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var component = CommonComponent();
    controller.forgotPwdFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        appBar: CommonWhiteAppbar(
            style: R.styles.txt18sizeW600White,
            title: R.strings.ksForgotPasswordAppbarText.toTranslate(),
            appBar: AppBar(),
            isLeading: false,
            isWhiteBack: true,
            statusbarcolor: R.colors.kcPrimaryColor,
            backgroundColor: R.colors.kcPrimaryColor,
            onTap: () => Get.offNamed(Routes.loginScreen)),
        body: SingleChildScrollView(
            child: Container(
                color: R.colors.kcPrimaryColor,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                        key: controller.forgotPwdFormKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              VectorDescriptionWidget(
                                  imagePath: R.images.forgotPasswordVector,
                                  description: R
                                      .strings.ksForgotPasswordParaText
                                      .toTranslate()),
                              buildEmailField(),
                              SizedBox(height: Get.height * 0.04),
                              buildButton(),
                              SizedBox(height: Get.height * 0.03),
                              appLogoComponent(component: component)
                            ]))))));
  }

  buildButton() {
    return CommonButton(
        onTap: () {
          Utils.logPrint("pressed........Pressed");
          controller.validAll();
        },
        color: R.colors.kcYellow,
        height: Get.height * 0.08,
        buttonName: R.strings.ksForgotPasswordButton.toTranslate());
  }

  buildEmailField() {
    return Padding(
        padding: const EdgeInsets.only(
          right: 2.0,
        ),
        child: AppTextField(
            isScreenTitle: true,
            hintText: R.strings.ksEditProfileEmailHint.toTranslate(),
            onChanged: (value) {
              Utils.logPrint(controller.emailController.text);
              controller.forgetValidation();
            },
            errorText: "",
            validator: Validator.validateEmail,
            textEditingController: controller.emailController,
            keyBoardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none));
  }

  appLogoComponent({component}) {
    return Center(child: component.commonLogo());
  }
}
