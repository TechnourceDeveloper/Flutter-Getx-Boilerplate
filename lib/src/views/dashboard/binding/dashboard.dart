import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class DashboradBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
  }
}
