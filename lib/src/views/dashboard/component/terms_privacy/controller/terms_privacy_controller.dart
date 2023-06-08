import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../global/utils/utills.dart';

class TermsPrivacyController extends GetxController {
  dynamic termsAndPrivacyAppBarText;
  var description = "".obs;
  RxString termsAndCondition = "https://www.technource.com/terms-conditions/".obs;
  RxString privacyPolicyUrl = "https://technource.com/privacy-policy/".obs;
  RxBool isLoading = true.obs;
  WebViewController? webViewController;

  @override
  void onClose() {
    super.onClose();
    termsAndPrivacyAppBarText = "";
  }

  @override
  void onInit() {
    super.onInit();
    termsAndPrivacyAppBarText = Get.arguments;
    // getCms();
  }
}
