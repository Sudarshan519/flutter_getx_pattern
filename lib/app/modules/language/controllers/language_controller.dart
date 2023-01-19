import 'package:get/get.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

class LanguageController extends GetxController {
  final AppSettings appSettings = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    appSettings.token == '' ? null : Get.toNamed(Routes.HOME);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
