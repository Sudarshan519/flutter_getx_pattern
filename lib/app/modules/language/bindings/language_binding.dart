import 'package:get/get.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

import '../controllers/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
