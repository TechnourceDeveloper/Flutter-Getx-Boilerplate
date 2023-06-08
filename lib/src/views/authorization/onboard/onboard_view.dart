
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/widgets/common_component.dart';
import '../../../../global/widgets/common_text.dart';
import 'controller/onboard_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    var component = CommonComponent();
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: SafeArea(
            child: Container(
                color: R.colors.kcPrimaryColor,
                child: Container(
                    margin: EdgeInsets.only(
                        left: Get.width * 0.01, right: Get.width * 0.01),
                    child: Column(children: [
                      introFirstSection(),
                      introSecondSection(
                          controller: controller, component: component),
                      SizedBox(height: Get.height * 0.04),
                      Center(child: component.commonLogo())
                    ])))));
  }

  introFirstSection() {
    return Obx(() {
      return Expanded(
          child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.changeIndicator(index: index);
              },
              itemCount: controller.onBoardImage.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(height: Get.height * 0.03),
                  Image.asset(controller.onBoardImage[index],
                      height: Get.height * 0.4),
                  SizedBox(height: Get.height * 0.05),
                  CommonText(
                      text: controller.onBoardTitle[index],
                      styleText: R.styles.txtIntroTitle),
                  SizedBox(height: Get.height * 0.01),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: CommonText(
                          text: controller.onBoardDescription[index],
                          styleText: R.styles.txt16sizeW600CaptionLightGray,
                          textAlign: TextAlign.center))
                ]);
              }));
    });
  }

  introSecondSection({controller, component}) {
    return Obx(() {
      return Row(children: [
        for (int i = 0; i < controller.onBoardImageLength.value; i++) ...[
          controller.selectedIndicator.value == i
              ? Container(
                  margin: EdgeInsets.all(Get.width * 0.01),
                  width: Get.width * 0.060,
                  height: Get.height * 0.060,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: R.colors.kcCaptionLightGray.withOpacity(0.3)),
                      shape: BoxShape.circle),
                  child: Container(
                      margin: EdgeInsets.all(Get.width * 0.01),
                      width: Get.width * 0.040,
                      height: Get.height * 0.040,
                      decoration: BoxDecoration(
                          color: R.colors.kcWhite, shape: BoxShape.circle)))
              : Container(
                  margin: EdgeInsets.all(Get.width * 0.01),
                  width: Get.width * 0.025,
                  height: Get.height * 0.025,
                  decoration: BoxDecoration(
                      color: R.colors.kcCaptionLightGray.withOpacity(0.2),
                      shape: BoxShape.circle))
        ],
        const Spacer(),
        controller.selectedIndicator.value ==
                controller.onBoardImageLength.value - 1
            ? const SizedBox()
            : InkWell(
                child: CommonText(
                    text: R.strings.ksSkip.toTranslate(),
                    styleText: R.styles.txt14sizeWithW600),
                onTap: () {
                  controller.skipNextTapped();
                }),
        SizedBox(width: Get.width * 0.02),
        InkWell(
            onTap: () {
              if (controller.selectedIndicator.value ==
                  controller.onBoardImageLength.value - 1) {
                controller.skipNextTapped();
              } else {
                controller.pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              }
            },
            child: Container(
                height: Get.height * 0.09,
                width: Get.width * 0.3,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Get.width * 0.2)),
                    color: R.colors.kcCaptionLightGray.withOpacity(0.2)),
                child: Center(
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: CommonText(
                            text: R.strings.ksNext.toTranslate(),
                            styleText: R.styles.txt18sizeW600White))))),
        SizedBox(width: Get.width * 0.02)
      ]);
    });
  }
}
