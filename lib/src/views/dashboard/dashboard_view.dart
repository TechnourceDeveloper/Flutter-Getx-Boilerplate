import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/constant/resources/resources.dart';
import 'component/bottom_navigation/bottom_navigation.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => controller.onBackCalled(context),
        child: Scaffold(
          body: Scaffold(
              key: controller.drawerKey,
              backgroundColor: R.colors.kcWhite,
              body: Obx(() => controller.widgetOptions.value
                  .elementAt(controller.currentSelected.value))),
          bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        ));
  }
}
