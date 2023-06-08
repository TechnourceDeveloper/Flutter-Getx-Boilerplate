import 'package:get/get.dart';
import '../controller/terms_privacy_controller.dart';

class TermsPrivacyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsPrivacyController>(() => TermsPrivacyController());
  }
}
