import 'dart:async';

import 'package:get/get.dart';

class CandidateLoginController extends GetxController {
  final count = 0.obs;
  get selected => count.value;
  set selected(value) => count(value);

  late Timer timer;
  var timerInit = false.obs;
  var now = DateTime.now().obs;
  var percentage = 0.0.obs;
  var loggedInTime = 4.0.obs;

  updatePercentage() {
    loggedInTime(loggedInTime.value + 1 / 3600);
    percentage(loggedInTime.value / 9);
  }

  @override
  void onInit() {
    super.onInit();
    timerInit(true);
    timer = Timer.periodic(1.seconds, (timer) {
      now(DateTime.now());
      updatePercentage();
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

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void increment() => count.value++;
}
