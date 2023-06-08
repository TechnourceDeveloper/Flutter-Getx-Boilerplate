import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/src/views/authorization/splash_screen/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'flutter_setup.dart';
import 'global/preference/user_preference.dart';
import 'global/utils/utills.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    AppSession.init();
    // Specifies the set of orientations
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    Get.put(SplashController());
    runApp(const FlutterSetupApp());
  }, (error, stackTrace) {
    Utils.logPrint(error.toString());
  });
}
