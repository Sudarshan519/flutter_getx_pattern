import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

enum AuthStatus { Uninitialized, Authenticated, Unauthenticated }

class CandidateLoginController extends GetxController {
  final count = 0.obs;
  get selected => count.value;

  get isAuthenticated => AuthStatus.Authenticated == _authStatus.value;
  set selected(value) => count(value);

  late Timer timer;
  var timerInit = false.obs;
  var now = DateTime.now().obs;
  var breakStarted = false.obs;
  var percentage = 0.0.obs;
  var loggedInTime = 4.0.obs;
  final _authStatus = AuthStatus.Unauthenticated.obs;
  AuthStatus get authStatus => _authStatus.value;
  set authStatus(AuthStatus status) => _authStatus(status);
  // login status
  final _isloggedIn = false.obs;
  bool get isloggedIn => _isloggedIn.value;
  set isloggedIn(bool userloginStatus) => _isloggedIn(userloginStatus);
  final _isloggedOut = false.obs;
  var d1 = 1.obs;
  var d2 = 0.obs;
  //
  updatePercentage() {
    if (loggedInTime.value > 100)
      loggedInTime(0);
    else
      loggedInTime(loggedInTime.value + 1);
    percentage(loggedInTime.value);
    // print(loggedInTime.value);
    if (now.value.second % 5 == 0) {
      if (d1 < 9) {
        d1(d1.value + 1);
      } else {
        d1(0);
        d2.value++;
      }
    }
  }

  // login
  login() async {
    final localAuth = LocalAuthentication();

    try {
      var isAuthenticated = await localAuth.authenticate(
          localizedReason: "Employee Identity Verification",
          options: const AuthenticationOptions(biometricOnly: false));
      if (isAuthenticated) {
        authStatus = AuthStatus.Authenticated;
        timerInit(true);
        timer = Timer.periodic(1.seconds, (timer) {
          now(DateTime.now());
          updatePercentage();
        });
      } else {
        authStatus = AuthStatus.Unauthenticated;
        Get.rawSnackbar(message: "Authentication Failed");
      }
    } on PlatformException catch (e) {
      Get.rawSnackbar(message: e.message);
    }
  }

  logout() {
    authStatus = AuthStatus.Unauthenticated;
    timer.cancel();
  }

  @override
  void onInit() {
    super.onInit();
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
