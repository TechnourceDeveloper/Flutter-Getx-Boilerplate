import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/utils/config.dart';
import '../../../../../global/utils/utills.dart';
import '../../../../../global/widgets/circle_image_view.dart';
import '../../../../../global/widgets/common_component.dart';
import '../../../../../global/widgets/common_text.dart';
import '../../../../routes/app_pages.dart';
import '../../controller/dashboard_controller.dart';
import '../../model/drawer model.dart';

var component = CommonComponent();

drawer({required controller}) {
  return Align(
      alignment: Alignment.topRight,
      child: Drawer(
          backgroundColor: R.colors.kcPrimaryColor,
          child: DrawerContainer(controller: controller)));
}

class DrawerContainer extends StatelessWidget {
  final dynamic controller;

  const DrawerContainer({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildDrawerContainer(controller);
  }
}

buildDrawerContainer(controller) {
  return Container(
      alignment: Alignment.topRight,
      height: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.01),
            buildDrawerUserInfo(),
            component.dividerColorCapitalLightGray(),
            SizedBox(height: Get.height * 0.03),
            buildDrawerList(),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  component.dividerColorCapitalLightGray(),
                  buildDrawerBottomItem(controller)
                ])),
            SizedBox(height: Get.height * 0.04)
          ]));
}

buildDrawerList() {
  return Column(children: [
    drawerTile(
        drawerItemModel:
            DrawerItemModel(pagename: "Bottom-Menu 1", selectedtile: 0)),
    drawerTile(
        drawerItemModel:
            DrawerItemModel(pagename: "Bottom-Menu 2", selectedtile: 1)),
    drawerTile(
        drawerItemModel:
            DrawerItemModel(pagename: "Bottom-Menu 3", selectedtile: 2)),
    drawerTile(
        drawerItemModel:
            DrawerItemModel(pagename: "Bottom-Menu 4", selectedtile: 3)),
    drawerTile(
        diplayLang: true,
        drawerItemModel:
            DrawerItemModel(pagename: Routes.changeLanguage, selectedtile: 4)),
    drawerTile(
        isLaunchUrl: true,
        drawerItemModel: DrawerItemModel(pagename: "", selectedtile: 5)),
    drawerTile(
        drawerItemModel:
            DrawerItemModel(pagename: Routes.moreScreen, selectedtile: 6))
  ]);
}

buildDrawerBottomItem(controller) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Column(children: [
        SizedBox(height: Get.height * 0.02),
        InkWell(
            onTap: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: Get.width * 0.06,
                  child: SvgPicture.asset(R.icons.icDeactivateAccount)),
              SizedBox(width: Get.width * 0.04),
              CommonText(
                  text: R.strings.ksDeactivateAccount.toTranslate(),
                  styleText: R.styles.txt16sizeW600CaptionLightGray)
            ])),
        SizedBox(height: Get.height * 0.03),
        InkWell(
            onTap: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: Get.width * 0.06,
                  child: SvgPicture.asset(R.icons.icDeactivateAccount)),
              SizedBox(width: Get.width * 0.04),
              CommonText(
                  text: R.strings.ksDeleteAccount.toTranslate(),
                  styleText: R.styles.txt16sizeW600CaptionLightGray)
            ])),
        SizedBox(height: Get.height * 0.03),
        InkWell(
            onTap: () {
              DashboardController.to.showLogoutDialogue();
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: Get.width * 0.06,
                  child: SvgPicture.asset(R.icons.icLogout)),
              SizedBox(width: Get.width * 0.04),
              CommonText(
                  text: R.strings.ksLogOut.toTranslate(),
                  styleText: R.styles.txt16sizeW600CaptionLightGray)
            ]))
      ]));
}

buildDrawerUserInfo() {
  return Container(
      height: Get.height * 0.15,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          InkWell(
              onTap: () {
                Get.toNamed(Routes.editProfileScreen);
              },
              child: CircleImageView(
                  imgUrl:
                      "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1683006951~exp=1683007551~hmac=2fd06f517ef15e591196789f6c93eecdc5a3779af174d07919ce247af9b9fbe3",
                  backgroundcolor: R.colors.kcTransparent)),
          SizedBox(width: Get.width * 0.005),
          Text("John Deo", style: R.styles.txt14sizeW600ckcWhite, maxLines: 3)
        ]),
        InkWell(
            onTap: () {
              Get.toNamed(Routes.editProfileScreen);
            },
            child: Image.asset(R.icons.icEdit, height: Get.height * 0.03))
      ]));
}

drawerTile(
    {required DrawerItemModel drawerItemModel,
    bool? diplayLang = false,
    bool? isLaunchUrl = false}) {
  return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: DashboardController.to.selectedDestination.value ==
              drawerItemModel.selectedtile
          ? BoxDecoration(
              color: const Color.fromRGBO(162, 168, 181, 0.35),
              borderRadius: BorderRadius.circular(8))
          : null,
      child: InkWell(
        onTap: () async {
          DashboardController.to.selectedDestination.value =
              drawerItemModel.selectedtile;
          if (isLaunchUrl == true) {
            openGithub(url: Config.githubRepoLink);
          } else {
            drawerItemModel.pagename.toString().contains("\"")
                ? null
                : Get.toNamed(drawerItemModel.pagename!);
          }

          Utils.logPrint("${drawerItemModel.selectedtile}");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: Get.width * 0.08,
                  height: Get.height * 0.03,
                  child: SvgPicture.asset(DashboardController
                      .to.drawerListIcons[drawerItemModel.selectedtile])),
              SizedBox(width: Get.width * 0.04),
              Text(
                  DashboardController
                      .to.drawerListString[drawerItemModel.selectedtile],
                  style: DashboardController.to.selectedDestination.value ==
                          drawerItemModel.selectedtile
                      ? R.styles.txt16sizeW600White
                      : R.styles.txt16sizeW600CaptionLightGray),
            ]),
            diplayLang!
                ? Row(
                    children: [
                      CommonText(
                        text: AppSession.getSelectedLanguageId()
                            .toUpperCase()
                            .toString(),
                        styleText: R.styles.txt16sizeW600White,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: R.colors.kcWhite,
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      )));
}

Future<void> openGithub({required String url}) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
