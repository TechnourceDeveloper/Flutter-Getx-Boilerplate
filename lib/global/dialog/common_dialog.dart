// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../constant/resources/resources.dart';
import '../utils/config.dart';
import '../widgets/common_button.dart';

// ignore: must_be_immutable
class CommonDialog extends StatelessWidget {
  final String? positiveBtnText, negativeBtnText, title;
  final String description;
  final VoidCallback? onPositiveTap;
  final VoidCallback? onNegativeTap;

  const CommonDialog(
      {Key? key,
      this.title,
      this.positiveBtnText,
      this.negativeBtnText,
      required this.description,
      this.onPositiveTap,
      this.onNegativeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDialogueHeader(),
                        SizedBox(height: Get.height * 0.03),
                        buildDesc(description: description),
                        SizedBox(height: Get.height * 0.05),
                        buildBtn(),
                        const SizedBox(height: 15)
                      ]))
            ]))));
  }

  buildDesc({required String description}) {
    return Center(
        child: Text(description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: R.colors.kcCaptionLightGray)));
  }

  buildBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: CommonButton(
              buttonName: positiveBtnText ?? "YES",
              color: R.colors.kcYellow,
              height: Get.height * 0.06,
              onTap: onPositiveTap)),
      SizedBox(width: Get.width*0.08),
      Expanded(
          child: CommonButton(
              color: R.colors.kcWhite,
              buttonName: negativeBtnText ??
                  R.strings.ksLogoutDilogueCancelButton.toTranslate(),
              height: Get.height * 0.06,
              onTap: onNegativeTap,
              borderColor: R.colors.kcPrimaryColor))
    ]);
  }

  buildDialogueHeader() {
    return Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(title == null ? Config.appName : title!,
                  textAlign: TextAlign.center,
                  style: R.styles.txt16sizeW600CaptionLightGray
                      .merge(TextStyle(color: R.colors.kcBlack))))),
      InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child:
                  Icon(Icons.clear, size: 25, color: R.colors.kcCaptionLightGray)))
    ]);
  }
}
