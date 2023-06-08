import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/utils/config.dart';
import '../../../../../global/widgets/common_appbar_white.dart';
import '../../../../../global/widgets/custom_progress_indicator.dart';
import 'controller/terms_privacy_controller.dart';

class TermsPrivacyView extends GetView<TermsPrivacyController> {
  const TermsPrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcWhite,
        appBar: CommonWhiteAppbar(
          backgroundColor: R.colors.kcWhite,
          title:
              controller.termsAndPrivacyAppBarText[0] == Config.cmsPrivacyPolicy
                  ? R.strings.ksPrivacyPolicy.toTranslate()
                  : R.strings.ksTermsAndConditions.toTranslate(),
          onTap: () {
            Get.back();
          },
          appBar: AppBar(),
        ),
        body: Obx(() => Stack(
              children: [
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9)),
                        child: WebView(
                            initialUrl:
                                controller.termsAndPrivacyAppBarText[0] ==
                                        Config.cmsPrivacyPolicy
                                    ? controller.privacyPolicyUrl.value
                                    : controller.termsAndCondition.value,
                            javascriptMode: JavascriptMode.unrestricted,
                            onPageFinished: (finish) {
                              controller.isLoading.value = false;
                            },
                            onWebViewCreated:
                                (WebViewController webViewController) {
                              controller.webViewController = webViewController;
                            }))),
                Visibility(
                    visible: controller.isLoading.value,
                    child: const CustomProgressIndicatorWidget())
              ],
            )));
  }
}
