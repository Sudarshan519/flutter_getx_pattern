import 'dart:async';

import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';

class MobileOptController extends GetxController {
  final count = 0.obs;
  final args = <dynamic>[].obs;
  var code = ''.obs;
  var loading = false.obs;
  var time = 120;
  var elapsedTime = 0.obs;
  late Timer timer;
  final AttendanceSystemProvider attendanceSystemProvider = Get.find();
  @override
  void onInit() {
    super.onInit();
    args(Get.arguments);
    timer = Timer.periodic(1.seconds, (timer) {
      if (elapsedTime < 0) {
        elapsedTime(120);
      }
      elapsedTime(time - timer.tick);
    });
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
      loading(true);
      showLoading();
      var res = await attendanceSystemProvider.verifyOtp(args[1], code.value);
      loading(false);
      Get.back();
      // if (args[0]) {
      //   Get.toNamed(Routes.EMPLOYER_DASHBOARD);
      // } else {
      //   Get.toNamed(Routes.DASHBOARD);
      // }
    } on BadRequestException catch (e) {
      loading(false);
      Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      loading(false);

      Get.back();
      e as FetchDataException;
      Get.rawSnackbar(message: e.message);
    }
  }
}
