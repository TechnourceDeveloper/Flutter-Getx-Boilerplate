import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/preference/user_preference.dart';
import '../../../../global/utils/utills.dart';
import '../../../../global/widgets/common_button.dart';
import '../../../../global/widgets/common_text.dart';
import '../../../routes/app_pages.dart';
import 'controller/select_language_controller.dart';
import 'model/get_language_list_model.dart';

class SelectLanguageScreenView extends GetView<SelectLanguageController> {
  const SelectLanguageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: Obx(() => !controller.isTranslationApiCalled.value
            ? Stack(children: [
                welcomeScreenBackgroud(),
                centerComponent(),
                bottomComponent()
              ])
            : Container()));
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
                  height: Get.height * 0.15, width: Get.width * 0.7))
        ]));
  }

  bottomComponent() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.all(Get.width * 0.04),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              buildLanguageDropDown(),
              SizedBox(height: Get.height * 0.04),
              CommonButton(
                  onTap: () {
                    if (controller.selectedLanguage.value.langId == "-1") {
                      Utils.errorSnackBar(message: "Please select language");
                    } else {
                      if (!AppSession.isIntroScreenDone()) {
                        Get.toNamed(Routes.onboard);
                      } else {
                        Get.toNamed(Routes.welcomeScreen);
                      }
                    }
                  },
                  height: Get.height * 0.08,
                  color: R.colors.kcYellow,
                  buttonName: R.strings.ksNext.toTranslate()),
              SizedBox(height: Get.height * 0.02)
            ])));
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

  welcomeScreenBackgroud() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(R.images.welcomeBg4x, fit: BoxFit.fill));
  }
}
