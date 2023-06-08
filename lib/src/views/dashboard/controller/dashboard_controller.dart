import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:flutter_setup/src/views/home_page/home_page_view.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/dialog/dialog_helper.dart';
import '../../../../global/preference/user_preference.dart';
import '../../../../global/utils/config.dart';
import '../component/bottom_navigation/bottom_navigation_child_view.dart';
import '../model/drawer model.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  RxBool isDrawerOpen = true.obs;
  DateTime backPressedTime = DateTime.now();
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  RxInt currentSelected = 0.obs;

  var drawerList = <DrawerModel>[].obs;
  RxInt drawerDataLength = 0.obs,
      moreScreenDataLength = 0.obs,
      selectedDrawerMenu = 0.obs,
      selectedDestination = 0.obs;
  var drawerListIcons = [
    R.icons.icBullet,
    R.icons.icBullet,
    R.icons.icBullet,
    R.icons.icBullet,
    R.icons.icLanguage,
    R.icons.icGithub,
    R.icons.icMore
  ].obs;

  var drawerListString = [
    "${R.strings.ksBottomMenu.toTranslate()} 1",
    "${R.strings.ksBottomMenu.toTranslate()} 2",
    "${R.strings.ksBottomMenu.toTranslate()} 3",
    "${R.strings.ksBottomMenu.toTranslate()} 4",
    R.strings.ksChangeLanguage.toTranslate(),
    R.strings.ksGitHub.toTranslate(),
    R.strings.ksMore.toTranslate(),
  ].obs;

  RxList<Widget> widgetOptions = <Widget>[
    HomePageView(),
    buildBottomTabChild(
        title: R.strings.ksBottomMenu.toTranslate(), index: "2"),
    buildBottomTabChild(
        title: R.strings.ksBottomMenu.toTranslate(), index: "3"),
    buildBottomSetting()
  ].obs;

  @override
  void onInit() {
    super.onInit();
    drawerDataLength.value = drawerListIcons.length;
    Config.isFromSplashPushNotification.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    Config.isFromSplashPushNotification.value = false;
  }

  showLogoutDialogue() {
    DialogueHelper.showCommonDialogue(
      onPositiveClick: () {
        Get.back();
        AppSession.logoutUser();
      },
      dialogueMsg: "",
      title: R.strings.ksLogoutDilogueTitle.toTranslate(),
      description: R.strings.ksLogoutDiloguePara.toTranslate(),
      onNegativeClick: () => Get.back(),
      positiveBtnText: R.strings.ksLogoutDilogueButton.toTranslate(),
      cancelBtnText: R.strings.ksLogoutDilogueCancelButton.toTranslate(),
    );
  }

  void onItemTapped(int index) {
    if (index == 4) {
      drawerKey.currentState?.openDrawer();
      currentSelected.value = index;
    } else {
      currentSelected.value = index;
    }
  }

  Future<bool> onBackCalled(BuildContext context) async {
    final difference = DateTime.now().difference(backPressedTime);
    backPressedTime = DateTime.now();
    if (difference >= const Duration(seconds: 2)) {
      toast(context: context, R.strings.ksExitApp.toTranslate());
      return false;
    } else {
      SystemNavigator.pop(animated: true);
      return true;
    }
  }
}
