import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'title': 'Hello World',
    },
    'bn_BD': {
      'ttle': 'হ্যালো',
    }
  };
}