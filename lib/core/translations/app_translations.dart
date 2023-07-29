import 'package:food_ordering2/core/translations/languages/ar_language.dart';
import 'package:food_ordering2/core/translations/languages/en_language.dart';
import 'package:get/get.dart';

class AppTranlation extends Translations {
  @override
  
  Map<String, Map<String, String>> get keys => {
    //every map from this must have external file
        "en_US": ENLanguage.map,
        "ar_SA": ARLanguage.map,
      };
}
//for upadets getX
tr(String key) => key.tr;
