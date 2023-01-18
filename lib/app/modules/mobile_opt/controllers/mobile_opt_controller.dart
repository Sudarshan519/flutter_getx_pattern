import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/routes/app_pages.dart';

class MobileOptController extends GetxController {
  //TODO: Implement MobileOptController

  final count = 0.obs;
  final args = [].obs;
  var code = ''.obs;
  final AttendanceSystemProvider attendanceSystemProvider = Get.find();
  @override
  void onInit() {
    super.onInit();
    args[Get.arguments];
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

  verifyOtp() async {
    try {
      var res = await attendanceSystemProvider.verifyOtp(args[1], code.value);
      if (Get.arguments) {
        Get.toNamed(Routes.EMPLOYER_DASHBOARD);
      } else {
        Get.toNamed(Routes.DASHBOARD);
      }
    } catch (e) {}
  }
}
