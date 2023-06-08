import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/widgets/common_component.dart';
import 'package:get/get.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../routes/app_pages.dart';
import '../../controller/dashboard_controller.dart';
import 'drawer.dart';

buildBottomSetting() {
  return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: R.colors.kcPrimaryColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          child: Container(
              margin: EdgeInsets.zero,
              color: R.colors.kcWhite,
              height: Get.height,
              width: Get.width,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                InkWell(
                  onTap: () => Get.offAllNamed(Routes.dashboardScreen),
                  child: Container(
                    color: R.colors.kcWhite,
                    width: Get.width * 0.150,
                    height: Get.height,
                  ),
                ),
                drawer(controller: DashboardController)
              ]))));
}

buildBottomTabChild({required String title, String? index}) {
  return Center(
    child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: CommonComponent().buildMenuText(index: index??"")),
  );
}
