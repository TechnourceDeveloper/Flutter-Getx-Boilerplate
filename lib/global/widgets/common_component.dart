import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import '../constant/resources/resources.dart';
import 'common_text.dart';

class CommonComponent {

  commonLogo() {
    return Image.asset(R.images.applogo,
        height: Get.height * 0.1, width: Get.width * 0.6);
  }

  dividerColorCapitalLightGray({double? opacity}) {
    return Divider(
        color: R.colors.kcCaptionLightGray.withOpacity(opacity ?? 1),
        thickness: 2);
  }

  buildMenuText({required String index}) {
    return Center(
        child: CommonText(
            text: "${R.strings.ksBottomMenu.toTranslate()}-$index",
            styleText: R.styles.txt24sizeW600kcCaptionLightGray
                .merge(TextStyle(color: R.colors.kcPrimaryColor))));
  }
}
