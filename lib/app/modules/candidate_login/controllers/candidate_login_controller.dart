import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

enum AuthStatus { Uninitialized, Authenticated, Unauthenticated }

enum BreakStatus { NotStarted, Started, Running, Ended }

class CandidateLoginController extends GetxController {
  final count = 0.obs;
  get selected => count.value;

  get isAuthenticated => AuthStatus.Authenticated == _authStatus.value;
  set selected(value) => count(value);

  late Timer timer;
  var timerInit = false.obs;
  var now = DateTime.now().obs;
  var breakStarted = BreakStatus.NotStarted.obs;

  var percentage = 0.0.obs;
  var breakStartedPercentage = 5.0.obs;
  var breakEndPercentage = 5.0.obs;
  var loggedInTime = 4.0.obs;
  final _authStatus = AuthStatus.Unauthenticated.obs;
  AuthStatus get authStatus => _authStatus.value;
  set authStatus(AuthStatus status) => _authStatus(status);
  // login status
  final _isloggedIn = false.obs;
  bool get isloggedIn => _isloggedIn.value;
  set isloggedIn(bool userloginStatus) => _isloggedIn(userloginStatus);
  final _isloggedOut = false.obs;
  bool get isLoggedOut => _isloggedOut.value;
  var d1 = 1.obs;
  var d2 = 0.obs;
  //

  startorStopBreak() {
    if (percentage.value > 10) {
      if (BreakStatus.NotStarted == breakStarted.value) {
        breakStarted(BreakStatus.Started);
        breakStartedPercentage(percentage.value);
        if (kDebugMode) {
          print(breakStartedPercentage.value);
        }
      } else if (breakStarted.value == BreakStatus.Started) {
        breakStarted(BreakStatus.Ended);
        breakEndPercentage(percentage.value);
        if (kDebugMode) {
          print(breakEndPercentage.value);
        }
      } else {}
    }
  }

  updatePercentage() {
    if (loggedInTime.value > 100) {
      logout();
    } else if (loggedInTime > 50 &&
        breakStarted.value == BreakStatus.NotStarted) {
      startorStopBreak();
    } else if (loggedInTime > 60 && breakStarted.value == BreakStatus.Started) {
      startorStopBreak();
    } else {
      loggedInTime(loggedInTime.value + 1);
    }
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
    breakStarted(BreakStatus.NotStarted);
    _isloggedOut(false);
    final localAuth = LocalAuthentication();
    var isSupported = false;
    var availbaleBiometrics = [];
    try {
      if (Platform.isAndroid) {
        isSupported = await localAuth.isDeviceSupported();
        availbaleBiometrics = await localAuth.getAvailableBiometrics();
        if (isSupported && availbaleBiometrics.isNotEmpty) {
          try {
            var isAuthenticated = await localAuth.authenticate(
                localizedReason: "Employee Identity Verification",
                options: const AuthenticationOptions(biometricOnly: false));
            if (isAuthenticated) {
              authStatus = AuthStatus.Authenticated;
              timer.cancel();
              _isloggedIn(true);
              timerInit(true);
              timer = Timer.periodic(1.seconds, (timer) {
                now(DateTime.now());
                if (!isLoggedOut && isloggedIn) updatePercentage();
              });
            } else {
              authStatus = AuthStatus.Unauthenticated;
              Get.rawSnackbar(message: "Authentication Failed");
            }
          } on PlatformException catch (e) {
            Get.rawSnackbar(message: e.message);
          }
        } else {
          if (kDebugMode) {
            authStatus = AuthStatus.Authenticated;
            timerInit(true);
            timer = Timer.periodic(1.seconds, (timer) {
              now(DateTime.now());
              updatePercentage();
            });
          }
        }
      }
    } catch (e) {}
  }

  logout() {
    authStatus = AuthStatus.Unauthenticated;
    // loggedInTime(0);
    // breakStarted(BreakStatus.NotStarted);
    _isloggedIn(false);
    _isloggedOut(true);
    timer.cancel();
    timerInit(true);
    timer = Timer.periodic(1.seconds, (timer) {
      now(DateTime.now());
      if (!isLoggedOut && isloggedIn) updatePercentage();
    });
  }

  @override
  void onInit() {
    super.onInit();

    timerInit(true);
    timer = Timer.periodic(1.seconds, (timer) {
      now(DateTime.now());
      if (!isLoggedOut && isloggedIn) updatePercentage();
    });
  }



  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void increment() => count.value++;
}
