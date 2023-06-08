import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 3), () {
      if (AppSession.isAuthenticationDone()) {
        Get.offAllNamed(Routes.dashboardScreen);
      } else {
        Get.offAllNamed(Routes.selectLanguage);
      }
    });
  }
}
