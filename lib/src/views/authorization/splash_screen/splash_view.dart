
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constant/resources/resources.dart';
import 'controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final SplashController splashController = Get.put(SplashController());

  SplashView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.kcPrimaryColor,
        body: SafeArea(
            child: Stack(children: [
          welcomeScreenBackgroud(),
          centerComponent(),
        ])));
  }

  welcomeScreenBackgroud() {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(R.images.welcomeBg4x, fit: BoxFit.fill));
  }

  centerComponent() {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(R.images.applogo,
                  height: Get.height * 0.15, width: Get.width * 0.7))
        ]));
  }
}
