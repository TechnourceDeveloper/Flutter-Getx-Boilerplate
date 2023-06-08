import 'package:get/get.dart';

import '../../../../../global/utils/config.dart';
import '../model/get_language_list_model.dart';

class SelectLanguageController extends GetxController {
  RxList<LanguageData> languageList = <LanguageData>[
    LanguageData(langId: "1", langName: "English", langCode: Config.langEn),
    LanguageData(langId: "2", langName: "French", langCode: Config.langFr),
    LanguageData(langId: "3", langName: "Russian", langCode: Config.langRu)
  ].obs;
  var selectedLanguage = LanguageData(langId: "-1").obs;
  RxString selectedLanguageName = "".obs;

  RxBool isTranslationApiCalled = false.obs;
}
