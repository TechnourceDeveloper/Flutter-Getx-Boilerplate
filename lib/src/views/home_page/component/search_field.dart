import 'package:flutter/material.dart';
import 'package:flutter_setup/global/extention/string_extensions.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/resources.dart';

class CommonSearchBar extends StatelessWidget {
  GestureTapCallback? onPrefixTap;
  Widget? prefix;
  GestureTapCallback? onSuffixTap;
  ValueChanged<String>? onFieldSubmitted;
  GestureTapCallback? editingComplete;
  ValueChanged<String>? onChanged;
  TextEditingController? controller;

  CommonSearchBar(
      {Key? key,
      this.onFieldSubmitted,
      this.prefix,
      this.controller,
      this.editingComplete,
      this.onPrefixTap,
      this.onSuffixTap,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: TextCapitalization.sentences,
        autofocus: false,
        textInputAction: TextInputAction.done,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: editingComplete,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: R.strings.ksSearchText.toTranslate(),
            contentPadding:
                const EdgeInsets.only(left: 0, right: 9, top: 9, bottom: 9),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.kcGray),
                borderRadius: BorderRadius.circular(10.0)),
            suffixIcon: IconButton(
                onPressed: onSuffixTap,
                icon: Image.asset(R.icons.icSearchIcon,
                    height: Get.width * 0.05)),
            prefixIcon: IconButton(
                onPressed: onPrefixTap,
                icon: Icon(Icons.arrow_back_ios_new,
                    size: 20, color: R.colors.kcBlack)),
            errorMaxLines: 2));
  }
}
