import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/src/views/home_page/component/search_field.dart';
import 'package:get/get.dart';
import '../../../global/constant/resources/resources.dart';
import 'controller/home_page_controller.dart';

// ignore: must_be_immutable
class HomePageView extends GetView<HomePageController> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
            backgroundColor: R.colors.kcWhite,
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.03),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildImage(imgPath: R.icons.icTechnourceLogo),
                                controller.isSearch.value
                                    ? Expanded(child: CommonSearchBar(
                                        onPrefixTap: () {
                                          controller.isSearch.value = false;
                                        },
                                      ))
                                    : InkWell(
                                        onTap: () {
                                          controller.isSearch.value = true;
                                        },
                                        child: buildImage(
                                            imgPath: R.icons.icSearchIcon)),
                              ],
                            );
                          })
                        ])))));
  }

  buildImage({required String imgPath}) {
    return Image.asset(imgPath,
        height: Get.height * 0.06, width: Get.width * 0.08);
  }
}
