
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../routes/app_pages.dart';
import 'controller/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: Stack(children: [
          welcomeScreenBackgroud(),
          centerComponent(),
          bottomComponent()
        ]));
  }

  welcomeScreenBackgroud() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(R.images.welcomeBg4x, fit: BoxFit.fill));
  }

  centerComponent() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(R.images.welcome4x,
                  height: Get.height * 0.88, width: Get.width * 0.7))
        ]));
  }

  bottomComponent() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              CommonButton(
                  onTap: () {
                    Get.offAllNamed(Routes.loginScreen);
                  },
                  height: Get.height * 0.08,
                  color: R.colors.kcYellow,
                  buttonName: R.strings.ksLoginButtonText.toTranslate()),
              SizedBox(height: Get.height * 0.02),
              CommonButton(
                  onTap: () {
                    Get.offAllNamed(Routes.signupScreen);
                  },
                  color: R.colors.kcPrimaryColor,
                  height: Get.height * 0.08,
                  buttonTextStyle: R.styles.txt14sizeW600ColorPrimary
                      .merge(TextStyle(color: R.colors.kcWhite)),
                  buttonName: R.strings.ksSignup.toTranslate(),
                  borderColor: R.colors.kcWhite),
              SizedBox(height: Get.height * 0.05)
            ])));
  }
}
