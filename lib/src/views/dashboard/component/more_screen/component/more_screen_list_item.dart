import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../global/constant/resources/resources.dart';
import '../../../../../../global/utils/utills.dart';
import '../../../../../../global/widgets/common_component.dart';
import '../../../../../../global/widgets/common_text.dart';

class MoreScreenListItem extends StatelessWidget {
  final int index;
  final dynamic controller;

  const MoreScreenListItem({Key? key, required this.index, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.selecteMoreScreenItem(index: index);
        },
        child: Column(children: [
          SizedBox(height: Get.height * 0.02),
          buildCommonListTile(
            title: controller.moreScreenListString[index],
          ),
          SizedBox(height: Get.height * 0.02),
          index == 4
              ? const SizedBox(height: 0.02)
              : CommonComponent().dividerColorCapitalLightGray(opacity: 0.2)
        ]));
  }

  buildCommonListTile({required String title}) {
    return Container(
        margin: EdgeInsets.only(left: Get.width * 0.02),
        child: Row(children: [
          CommonText(
              text: title.toString(),
              styleText: R.styles.txt12sizeW600ColorPrimary)
        ]));
  }
}
