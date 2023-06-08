
import 'package:get/get.dart';

class Config {
  static var appName = "Technource FlutterSetup";
  static String fcmToken = "";
  static RxBool isFromSplashPushNotification = false.obs;


  ///Cms Pages Slug Name
  static var cmsPrivacyPolicy = "privacy-policy";
  static var cmsTermsCondition = "terms-conditions";

  static RxString notificationCount = "0".obs;

  static RxString setLocale = 'en'.obs;

  static String langEn = 'en';
  static String langRu = 'ru';
  static String langFr = 'fr';

  static String langEnCountry = 'US';
  static String langRuCountry = 'RU';
  static String langFrCountry = 'CA';
  static String githubRepoLink="https://github.com/vedmant/running-time";

}
