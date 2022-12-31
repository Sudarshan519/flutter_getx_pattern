import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

enum AuthStatus { Uninitialized, Authenticated, Unauthenticated }

class CandidateLoginController extends GetxController {
  final count = 0.obs;
  get selected => count.value;
  set selected(value) => count(value);

  late Timer timer;
  var timerInit = false.obs;
  var now = DateTime.now().obs;
  var percentage = 0.0.obs;
  var loggedInTime = 4.0.obs;
  var _authStatus = AuthStatus.Unauthenticated.obs;
  AuthStatus get authStatus => _authStatus.value;
  set authStatus(AuthStatus status) => _authStatus(status);
  // login status
  var _isloggedIn = false.obs;
  bool get isloggedIn => _isloggedIn.value;
  set isloggedIn(bool userloginStatus) => _isloggedIn(userloginStatus);

  var d1 = 1.obs;
  //
  updatePercentage() {
    loggedInTime(loggedInTime.value + 1 / 3600);
    percentage(loggedInTime.value / 9);
    if (now.value.second % 5 == 0) {
      if (d1 < 9) {
        d1(d1.value + 1);
      } else {
        d1(0);
      }
    }
  }

  // login
  login() async {
    final localAuth = LocalAuthentication();

    try {
      var isAuthenticated = await localAuth.authenticate(
          localizedReason: "Verify to continue",
          options: AuthenticationOptions(biometricOnly: false));
      if (isAuthenticated) {
        authStatus = AuthStatus.Authenticated;
      } else {
        authStatus = AuthStatus.Unauthenticated;
        Get.rawSnackbar(message: "Authentication Failed");
      }
    } on PlatformException catch (e) {
      Get.rawSnackbar(message: e.message);
    }
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
