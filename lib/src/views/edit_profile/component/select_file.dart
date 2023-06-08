import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../global/utils/utills.dart';

class FilePickerController extends GetxController {
  static FilePickerController get to => Get.put(FilePickerController());
  File? image;
  String? imagePath;
  final _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    image = null;
  }

  Future<void> requestCameraPermission({
    required ValueChanged<File?>? onCamera,
    required bool isCrop,
  }) async {
    // final serviceStatus = await Permission.camera.isGranted;

    // bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        if (image != null) {
          File file = File(image!.path);
          if (isCrop) {
            CroppedFile filePath = await _cropImage(file.path);
            onCamera!(File(filePath.path));
          } else {
            onCamera!(file);
          }
        }
      } else {
        Utils.logPrint('No image selected.');
      }
      Utils.logPrint('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      Utils.logPrint('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      Utils.logPrint('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  Future<void> requestGalleryPermission({
    ValueChanged<File?>? onGallery,
    required bool isCrop,
  }) async {
    // final serviceStatus = await Permission.storage.isGranted;

    // bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.storage.request();

    if (status == PermissionStatus.granted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imagePath = File(pickedFile.path);
        image = imagePath;
        Utils.logPrint("Image: $image");
        if (isCrop) {
          CroppedFile filePath = await _cropImage(imagePath.path);
          onGallery!(File(filePath.path));
        } else {
          onGallery!(image);
        }
      } else {
        Utils.logPrint('No image selected.');
      }
      Utils.logPrint('Permission Granted');
    } else if (status == PermissionStatus.denied) {
      Utils.logPrint('Permission denied');
    } else if (status == PermissionStatus.permanentlyDenied) {
      Utils.logPrint('Permission Permanently Denied');
      await openAppSettings();
    }
  }

  void openBottomSheet(
      {required ValueChanged<File?>? onCamera,
      ValueChanged<File?>? onGallery,
      List<String>? allowedExtension,
      ValueChanged<File?>? onFile,
      required bool isCrop,
      bool? showDocumentMenu,
      GestureTapCallback? onRemove}) {
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  "Camera",
                  style: TextStyle(color: Get.theme.colorScheme.shadow),
                ),
                leading: Icon(
                  Icons.camera_alt_rounded,
                  color: Get.theme.colorScheme.shadow,
                ),
                onTap: () async {
                  Get.back();
                  image = null;
                  requestCameraPermission(isCrop: isCrop, onCamera: onCamera);
                },
              ),
              ListTile(
                title: Text(
                  "Gallery",
                  style: TextStyle(color: Get.theme.colorScheme.shadow),
                ),
                leading: Icon(
                  Icons.photo_library,
                  color: Get.theme.colorScheme.shadow,
                ),
                onTap: () async {
                  Get.back();
                  image = null;
                  requestGalleryPermission(
                      isCrop: isCrop, onGallery: onGallery);
                },
              ),
              showDocumentMenu != null && showDocumentMenu
                  ? ListTile(
                      title: Text(
                        "Pdf",
                        style: TextStyle(color: Get.theme.colorScheme.shadow),
                      ),
                      leading: Icon(
                        Icons.picture_as_pdf,
                        color: Get.theme.colorScheme.shadow,
                      ),
                      onTap: () async {
                        Get.back();
                        image = null;
                        FilePickerResult? result;
                        result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: allowedExtension ?? ['pdf'],
                        );
                        if (result != null) {
                          File file = File(result.files.single.path!);
                          onFile!(file);
                        }
                      },
                    )
                  : Container(),
              onRemove != null
                  ? ListTile(
                      title: Text(
                        "Remove",
                        style: TextStyle(color: Get.theme.colorScheme.shadow),
                      ),
                      leading: Icon(
                        Icons.delete_forever,
                        color: Get.theme.colorScheme.shadow,
                      ),
                      onTap: onRemove,
                    )
                  : Container()
            ],
          ),
        ),
        elevation: 20.0,
        enableDrag: true,
        backgroundColor:
            Get.isDarkMode ? Get.theme.colorScheme.background : Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }

  _cropImage(String path) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: path, aspectRatioPresets: [
      CropAspectRatioPreset.square
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Crop Image',

          toolbarColor: Get.theme.colorScheme.secondary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true),
      IOSUiSettings(title: 'Cropper'),
    ]);
    return croppedFile;
  }
}
