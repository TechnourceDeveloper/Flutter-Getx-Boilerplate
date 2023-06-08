import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_setup/src/views/edit_profile/component/select_file.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../global/constant/resources/resources.dart';
import '../../../../global/utils/utills.dart';

// ignore: must_be_immutable
class UserProfile extends StatelessWidget {
  Rx<File> selectedFile;
  RxString networkImg;

  UserProfile({Key? key, required this.selectedFile, required this.networkImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildImageContainer();
  }

  buildImageContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Obx(() => selectedFile.value.path != ""
              ? buildSelectedImg()
              : (networkImg.value != "")
                  ? buildUrlImg()
                  : buildDefaultImg()),
          buildPickImg()
        ],
      ),
    );
  }

  buildPickImg() {
    return InkWell(
        onTap: () {
          FilePickerController.to.openBottomSheet(
              onCamera: (file) {
                if (file != null) {
                  selectedFile.value = file;
                  Utils.logPrint(file.path.toString());
                }
                // EditProfileController.to.isAnyDataChanged();
              },
              isCrop: true,
              onGallery: (file) {
                if (file != null) {
                  selectedFile.value = file;
                  Utils.logPrint(file.path.toString());
                }
                // EditProfileController.to.isAnyDataChanged();
              });
        },
        child: Image.asset(
          R.icons.cameraIcon,
          height: Get.height * 0.070,
        ));
  }

  buildDefaultImg() {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0, top: 8),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(180),
          child: Image.asset(R.images.defaultAvatar,
              width: Get.height * 0.16, height: Get.height * 0.16)),
    );
  }

  buildUrlImg() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 8),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(180),
          child: networkImg.value != ""
              ? Image.network(
                  networkImg.value,
                  width: Get.height * 0.16,
                  height: Get.height * 0.16,
                  fit: BoxFit.cover,
                  errorBuilder: (context, url, error) => buildPlaceHolder(),
                )
              : buildPlaceHolder()),
    );
  }

  buildSelectedImg() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, top: 12),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(180),
          child: Image.file(selectedFile.value,
              width: Get.height * 0.16,
              height: Get.height * 0.16,
              fit: BoxFit.cover)),
    );
  }

  buildPlaceHolder() {
    return SizedBox(
        width: Get.height * 0.16,
        height: Get.height * 0.16,
        child: Image.asset(R.images.defaultAvatar, fit: BoxFit.cover));
  }

  buildLoaderPlaceHolder() {
    return SizedBox(
        width: Get.height * 0.02,
        height: Get.height * 0.02,
        child: LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [Colors.grey.shade100, R.colors.kcPrimaryColor],
        ));
  }
}
