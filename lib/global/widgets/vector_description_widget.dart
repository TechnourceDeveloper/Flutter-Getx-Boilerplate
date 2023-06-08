import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/resources/resources.dart';
import 'common_text.dart';

class VectorDescriptionWidget extends StatelessWidget {
  final String imagePath, description;

  const VectorDescriptionWidget(
      {Key? key, required this.imagePath, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: Get.height * 0.01),
      showForgotPasswordVector(),
      SizedBox(height: Get.height * 0),
      showForgotPasswordPara(),
      SizedBox(height: Get.height * 0.04)
    ]);
  }

  showForgotPasswordVector({component}) {
    return Container(
        height: Get.height * 0.4,
        width: Get.width * 0.7,
        margin: const EdgeInsets.only(top: 0.0),
        child: Image.asset(imagePath));
  }

  showForgotPasswordPara({component}) {
    return CommonText(
        text: description,
        styleText: R.styles.txt14sizeW500ColorPrimary
            .merge(TextStyle(color: R.colors.kcSubtitleText2)),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
  }
}
