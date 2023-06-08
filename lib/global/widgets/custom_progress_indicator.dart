import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constant/resources/resources.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  final double? height, width;

  const CustomProgressIndicatorWidget({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: R.colors.kcTransparent),
        child: Align(
            alignment: Alignment.center,
            child: Container(
                height: 100,
                constraints: const BoxConstraints.expand(width: 50, height: 50),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: FittedBox(
                    fit: BoxFit.none,
                    child: SizedBox(
                        height: height ?? Get.height * 0.2,
                        width: width ?? Get.width * 0.25,
                        child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: [
                              R.colors.kcYellow,
                              R.colors.kcPrimaryColor
                            ]))))));
  }
}
