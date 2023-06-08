import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/preference/user_preference.dart';
import '../../../../routes/app_pages.dart';

class OnBoardController extends GetxController {
  PageController pageController = PageController();
  var onBoardImage =
      [R.images.introVector1, R.images.introVector1, R.images.introVector1].obs;
  var onBoardTitle = [
    "${R.strings.ksTitle.toTranslate()} 1",
    "${R.strings.ksTitle.toTranslate()} 2",
    "${R.strings.ksTitle.toTranslate()} 3",
  ].obs;
  var onBoardDescription = [
    "${R.strings.ksDescription.toTranslate()} 1",
    "${R.strings.ksDescription.toTranslate()} 2",
    "${R.strings.ksDescription.toTranslate()} 3"
  ].obs;
  var selectedIndicator = 0.obs,onBoardImageLength = 0.obs;

  @override
  void onInit() {
    super.onInit();
    onBoardImageLength.value = onBoardImage.length;
  }

  changeIndicator({required index}) {
    selectedIndicator.value = index;
  }

  skipNextTapped() {
    AppSession.setIsIntroScreenDone(true);
    Get.offAllNamed(Routes.welcomeScreen);
  }
}
