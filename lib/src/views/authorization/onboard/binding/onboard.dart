

import 'package:get/get.dart';

import '../controller/onboard_controller.dart';

class OnBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(() => OnBoardController());
  }

}