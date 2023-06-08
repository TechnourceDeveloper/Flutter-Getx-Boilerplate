import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/utils/config.dart';

buildBottomNavigationMenu(context, controller) {
  return Obx(() => SizedBox(
      width: Get.width,
      child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentSelected.value,
          backgroundColor: R.colors.kcPrimaryColor,
          selectedFontSize: 0,
          items: [
            buildBottomNavigationBarItem(
                title: "${R.strings.ksBottomMenu.toTranslate()} 1",
                activeimage: R.icons.icActiveBottomHome,
                deactiveImage: R.icons.icDeactiveBottomHome),
            buildBottomNavigationBarItem(
                title: "${R.strings.ksBottomMenu.toTranslate()} 2",
                activeimage: R.icons.icActiveBottomOrder,
                deactiveImage: R.icons.icDeactiveBottomOrder),
            buildBottomNavigationBarItem(
                title: "${R.strings.ksBottomMenu.toTranslate()} 3",
                isNotification:
                    Config.notificationCount.value == "0" ? false : true,
                activeimage: R.icons.icActiveBottomNotification,
                deactiveImage: R.icons.icDeactiveBottomNotification),

            buildBottomNavigationBarItem(
                ontap: () {
                  controller.drawerKey.currentState.openDrawer();
                },
                title: "${R.strings.ksBottomMenu.toTranslate()} 4",
                activeimage: R.icons.icActiveBottomSetting,
                deactiveImage: R.icons.icDeactiveBottomSetting)
          ])));
}

BottomNavigationBarItem buildBottomNavigationBarItem(
    {String? title,
    String? activeimage,
    String? deactiveImage,
    bool? isNotification,
    GestureTapCallback? onDeactiveTap,
    GestureTapCallback? ontap}) {
  return BottomNavigationBarItem(
      icon: InkWell(
          onTap: onDeactiveTap,
          child: Column(children: [
            SizedBox(height: Get.height * 0.02),
            isNotification == true
                ? Stack(alignment: Alignment.topRight, children: [
                    SvgPicture.asset(deactiveImage!),
                    Obx(() => Container(
                        width: 17,
                        height: 17,
                        decoration: BoxDecoration(
                            color: R.colors.kcYellow,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                                int.parse(Config.notificationCount.value) > 99
                                    ? "99+"
                                    : Config.notificationCount.value,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold)))))
                  ])
                : SvgPicture.asset(deactiveImage!),
            SizedBox(
              height: Get.height * 0.009,
            ),
            Text(title!, style: R.styles.unselectedLabelStyle)
          ])),
      activeIcon: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            isNotification == true
                ? Stack(alignment: Alignment.topRight, children: [
                    SvgPicture.asset(activeimage!),
                    Obx(() => Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: R.colors.kcYellow,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                                int.parse(Config.notificationCount.value) > 99
                                    ? "99+"
                                    : Config.notificationCount.value,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold)))))
                  ])
                : SvgPicture.asset(activeimage!),
            SizedBox(
              height: Get.height * 0.009,
            ),
            Text(
              title,
              style: R.styles.selectedLabelStyle,
            ),
            SizedBox(
              height: Get.height * 0.009,
            ),
            Container(
              width: Get.width * 0.06,
              height: Get.height * 0.006,
              color: R.colors.kcYellow,
            )
          ],
        ),
      ),
      label: "",
      backgroundColor: R.colors.kcPrimaryColor);
}
