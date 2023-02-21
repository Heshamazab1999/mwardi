import 'package:get/get.dart';

import 'locales/ar_eg.dart';
import 'locales/en_us.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': en_us, 'ar': ar_eg};
}
