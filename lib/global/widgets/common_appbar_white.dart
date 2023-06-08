import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constant/resources/resources.dart';
import 'common_text.dart';

class CommonWhiteAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;

  final String title;
  final AppBar appBar;
  final VoidCallback? onTap;
  final List<Widget>? widgets;

  final TabBar? tabbar;
  final double? height;
  final TextStyle? style;
  final Color? statusbarcolor;
  final bool? isLeading, isWhiteBack;
  final double? elevation;

  /// you can add more fields that meet your needs

  const CommonWhiteAppbar(
      {super.key,
      required this.title,
      required this.appBar,
      this.widgets,
      this.elevation,
      this.statusbarcolor,
      this.backgroundColor,
      this.onTap,
      this.tabbar,
      this.style,
      this.height,
      this.isLeading,
      this.isWhiteBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: statusbarcolor ?? R.colors.kcWhite,
            // Status bar brightness (optional)
            statusBarIconBrightness: Brightness.dark,
            // For Android (dark icons)
            statusBarBrightness: Brightness.light // For iOS (dark icons)
            ),
        elevation: elevation ?? 0,
        leadingWidth: Get.width * 0.09,
        automaticallyImplyLeading: false,
        title: CommonText(
            text: title,
            styleText: style ??
                R.styles.txt18sizeW600White.merge(TextStyle(
                    color: R.colors.kcPrimaryColor,
                    fontWeight: FontWeight.w700)),
            textAlign: TextAlign.center),
        backgroundColor: backgroundColor ?? R.colors.kcWhite,
        actions: widgets,
        bottom: tabbar,
        leading: isLeading == true
            ? null
            : GestureDetector(
                onTap: onTap,
                child: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.05),
                    child: SvgPicture.asset(R.icons.icBack,
                        color: isWhiteBack == true
                            ? R.colors.kcWhite
                            : R.colors.kcBlack))),
        centerTitle: true);
  }

  @override
  Size get preferredSize => Size.fromHeight(height == null
      ? appBar.preferredSize.height
      : appBar.preferredSize.height * 2);
}
