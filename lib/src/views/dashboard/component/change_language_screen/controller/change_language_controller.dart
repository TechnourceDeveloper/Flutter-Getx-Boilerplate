import 'package:get/get.dart';

import '../../../../authorization/select_language_screen/model/get_language_list_model.dart';

class ChangeLanguageController extends GetxController {
  RxList<LanguageData> languageList = <LanguageData>[
    LanguageData(langId: "1", langName: "English", langCode: "en"),
    LanguageData(langId: "2", langName: "French", langCode: "fr"),
    LanguageData(langId: "3", langName: "Russian", langCode: "ru")
  ].obs;
  var selectedLanguage = LanguageData(langId: "-1").obs;
  RxString selectedLanguageName = "".obs;
}
