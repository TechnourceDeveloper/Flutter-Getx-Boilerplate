// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import '../../global/theme/light_theme.dart';
import '../../global/utils/config.dart';
import 'global/app_localization/app_localization.dart';
import 'global/constant/resources/resources.dart';

class FlutterSetupApp extends StatelessWidget {
  const FlutterSetupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                systemNavigationBarColor: R.colors.kcPrimaryColor,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light),
            child: GetMaterialApp(
                title: Config.appName,
                enableLog: true,
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                locale: Locale(Config.setLocale.value),
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [
                  Locale(Config.langEn, Config.langEnCountry),
                  Locale(Config.langRu, Config.langRuCountry),
                  Locale(Config.langFr, Config.langFrCountry)
                ],
                theme: lightThemeData(context),
                getPages: AppPages.routes)));
  }
}
