import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/preference/user_preference.dart';
import '../../../../../global/utils/config.dart';
import '../../../../../global/widgets/common_appbar_white.dart';
import '../../../../../global/widgets/common_text.dart';
import '../../../authorization/select_language_screen/model/get_language_list_model.dart';
import 'controller/change_language_controller.dart';

class ChangeLanguageScreenView extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        backgroundColor: R.colors.kcWhite,
        appBar: CommonWhiteAppbar(
            appBar: AppBar(),
            backgroundColor: R.colors.kcWhite,
            title: R.strings.ksChangeLanguage.toTranslate(),
            onTap: () {
              Get.back();
            }),
        body: Obx(() => Column(children: [topComponent()]))));
  }

  topComponent() {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [buildLanguageDropDown()])));
  }

  buildLanguageDropDown() {
    return Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CommonText(
              text: R.strings.ksSelectLanguageHint.toTranslate(),
              styleText: R.styles.txt14sizeW600ckcWhite),
          SizedBox(height: Get.height * 0.02),
          Obx(() => Container(
              height: Get.height * 0.07,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Get.height * 0.01)),
                  color: R.colors.kcInputFilled),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<LanguageData>(
                      value: controller.selectedLanguage.value.langId != "-1"
                          ? controller.selectedLanguage.value
                          : null,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey, size: 30),
                      onTap: () {},
                      isExpanded: true,
                      style: R.styles.txt10sizeWithW700,
                      onChanged: (LanguageData? data) {
                        controller.selectedLanguage.value = data!;
                        controller.selectedLanguageName.value =
                            data.langName.toString();
                        Config.setLocale.value = controller
                            .selectedLanguage.value.langCode
                            .toString();
                        AppSession.setSelectedLanguageId(
                            Config.setLocale.value);

                        Get.updateLocale(Locale(Config.setLocale.value));
                        controller.update();
                      },
                      hint: Text(R.strings.ksSelectLanguageHint.toTranslate(),
                          style: R.styles.txt14sizeW500CaptionLightGray),
                      items: controller.languageList.map((LanguageData genre) {
                        return DropdownMenuItem<LanguageData>(
                            value: genre,
                            child: Text(genre.langName!,
                                style: R.styles.txt14sizeW500CaptionLightGray));
                      }).toList()))))
        ]));
  }
}
