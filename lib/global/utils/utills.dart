import 'dart:developer' as logging;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static logPrint(String msg) {
    logging.log("fromLog: $msg");
  }

  static errorSnackBar({String title = 'Error', required String message}) {
    Get.log("[$title] $message", isError: true);
    if (message != "" && message != "{}") {
      return Get.showSnackbar(GetSnackBar(
          messageText: Text(message,
              style: Get.textTheme.bodySmall!
                  .merge(const TextStyle(color: Colors.white))),
          snackPosition: SnackPosition.BOTTOM,
          margin:
              EdgeInsets.only(bottom: Get.height * 0.15, right: 20, left: 20),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          duration: const Duration(seconds: 3)));
    }
  }

  static successSnackBar({String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    if (message != "" && message != "{}") {
      return Get.showSnackbar(GetSnackBar(
          messageText: Text(message,
              style: Get.textTheme.bodySmall!
                  .merge(const TextStyle(color: Colors.white))),
          snackPosition: SnackPosition.BOTTOM,
          margin:
              EdgeInsets.only(bottom: Get.height * 0.15, right: 20, left: 20),
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          borderRadius: 8,
          dismissDirection: DismissDirection.horizontal,
          duration: const Duration(seconds: 3)));
    }
  }
}
