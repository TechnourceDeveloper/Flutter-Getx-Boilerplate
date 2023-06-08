import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_dialog.dart';

class DialogueHelper {
  static showCommonDialogue(
      {required VoidCallback onPositiveClick,
      required VoidCallback onNegativeClick,
      required String positiveBtnText,
      description,
      String? title,
      required String cancelBtnText,
      required String dialogueMsg}) {
    showDialog(
        context: Get.context!,
        builder: (ctx) {
          return CommonDialog(
              description: description ?? "",
              negativeBtnText: cancelBtnText,
              onNegativeTap: onNegativeClick,
              onPositiveTap: onPositiveClick,
              positiveBtnText: positiveBtnText,
              title: title);
        });
  }
}

