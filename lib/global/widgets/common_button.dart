import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/resources/resources.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? onTap;
  final String? buttonName;
  final TextStyle? buttonTextStyle;
  final dynamic borderColor;

  const CommonButton(
      {Key? key,
      this.width,
      this.height,
      this.buttonTextStyle,
      this.borderColor,
      this.color,
      this.buttonName,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color ?? R.colors.kcYellow,
            borderRadius: BorderRadius.circular(Get.height * 0.01),
            border:
                borderColor == null ? null : Border.all(color: borderColor)),
        child: Material(
            color: R.colors.kcTransparent,
            child: InkWell(
                onTap: onTap,
                child: SizedBox(
                    height: height,
                    width: width,
                    child: Center(
                        child: CommonText(
                            textAlign: TextAlign.center,
                            text: buttonName.toString(),
                            styleText: buttonTextStyle ??
                                R.styles.txt14sizeW700ColorPrimary))))));
  }
}
