import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';
import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/widgets/common_appbar_white.dart';
import 'component/more_screen_list_item.dart';
import 'controller/more_screen_controller.dart';

class MoreScreenView extends GetView<MoreScreenController> {
  const MoreScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWhiteAppbar(
            title: R.strings.ksMore.toTranslate(),
            backgroundColor: R.colors.kcWhite,
            appBar: AppBar(),
            onTap: () {
              Get.back();
            }),
        body: SafeArea(
            child: Container(
                color: R.colors.kcWhite,
                height: double.infinity,
                width: double.infinity,
                child: Container(
                    margin: EdgeInsets.only(
                        left: Get.width * 0.04, right: Get.width * 0.04),
                    child: Column(children: [
                      Obx(() {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: controller.moreScreenDataLength.value,
                              itemBuilder: (context, index) {
                                return MoreScreenListItem(
                                    index: index, controller: controller);
                              }),
                        );
                      })
                    ])))));
  }
}
