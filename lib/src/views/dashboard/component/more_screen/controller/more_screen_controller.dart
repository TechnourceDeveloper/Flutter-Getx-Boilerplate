import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../../../global/constant/resources/resources.dart';
import '../../../../../../global/utils/config.dart';
import '../../../../../../global/utils/utills.dart';
import '../../../../../routes/app_pages.dart';

class MoreScreenController extends GetxController {
  static MoreScreenController get to => Get.find();

  // final InAppReview inAppReview = InAppReview.instance;

  var moreScreenListString = [
    R.strings.ksAboutUs.toTranslate(),
    R.strings.ksTermsAndCondition.toTranslate(),
    R.strings.ksPrivacyPolicy.toTranslate(),
  ].obs;

  var moreScreenDataLength = 0.obs;

  var selectedMoreScreenItemValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Utils.logPrint("ON Init Method");

    moreScreenDataLength.value = moreScreenListString.length;
  }

  Future<void> selecteMoreScreenItem({required int index}) async {
    selectedMoreScreenItemValue.value = index;
    switch (index) {
      case 0:
        Get.toNamed(Routes.aboutUs);
        break;
      case 1:
        Get.toNamed(Routes.termsPrivacyScreen,
            arguments: [Config.cmsTermsCondition]);
        break;
      case 2:
        Get.toNamed(Routes.termsPrivacyScreen,
            arguments: [Config.cmsPrivacyPolicy]);
        break;
      default:
        break;
    }
  }
}
