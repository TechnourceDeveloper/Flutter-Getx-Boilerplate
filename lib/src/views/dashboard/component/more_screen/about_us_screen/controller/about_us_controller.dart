import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsController extends GetxController {
  static AboutUsController get to => Get.find();
  RxString aboutUrl = "https://www.technource.com/services/".obs;
  RxBool isLoading = true.obs;
  WebViewController? webViewController;

}
