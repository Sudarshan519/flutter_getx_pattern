import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
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
  var loggedInTime = 0.0.obs;
  final _authStatus = AuthStatus.Unauthenticated.obs;
  AuthStatus get authStatus => _authStatus.value;
  set authStatus(AuthStatus status) => _authStatus(status);
  // login status
  final _isloggedIn = false.obs;
  bool get isloggedIn => _isloggedIn.value;
  set isloggedIn(bool userloginStatus) => _isloggedIn(userloginStatus);
  final _isloggedOut = false.obs;
  bool get isLoggedOut => _isloggedOut.value;
  set isLoggedOut(bool v) => _isloggedOut(v);
  var d1 = 0.obs;
  var d2 = 0.obs;
  var d3 = 0.obs;
  var d4 = 0.obs;
  var d5 = 0.obs;
  var d6 = 0.obs;
  var earning = 0.00.obs;
  //
  final attendaceApi = Get.find<AttendanceSystemProvider>();
  var totalHours = 8 * 60 * 60;
  startorStopBreak() {
    if (percentage.value > 10) {
      if (BreakStatus.NotStarted == breakStarted.value) {
        startBreakSubmit();
        breakStarted(BreakStatus.Started);
        breakStartedPercentage(percentage.value);
        if (kDebugMode) {
          print(breakStartedPercentage.value);
        }
      } else if (breakStarted.value == BreakStatus.Started) {
        stopBrakSubmit();
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
      loggedInTime(loggedInTime.value + 1 / (8 * 60 * 60));
    }
    percentage(loggedInTime.value);
    // print(loggedInTime.value);
    if (true
        //now.value.second % 5 == 0
        ) {
      if (d1 < 9) {
        var value = (1000 / (8 * 60 * 60) * loggedInTime.value);
        // print(value.toPrecision(2));
        var values = (value.toStringAsFixed(2));
        d1.value = int.parse(values.toString().split('')[3]);
        // d1(1000/(8*60*60))
        // d1(d1.value + 1);
        // d1.value++;
      } else {
        d1(0);
        if (d2 < 9) {
          var value = (1000 / (8 * 60 * 60) * loggedInTime.value);
          // print(value.toPrecision(2));
          var values = (value.toStringAsFixed(2));
          d1.value = int.parse(values.toString().split('')[3]);
          d2.value++;
        } else {
          var value = (1000 / (8 * 60 * 60) * loggedInTime.value);
          // print(value.toPrecision(2));
          var values = (value.toStringAsFixed(2));
          d1.value = int.parse(values.toString().split('')[3]);
          earning(double.parse(values.toString().split('.')[0]));

          // earning(percentage / 97 * 1000);
          // print(earning.value);
          d2(0);
        }
      }

      // if (d3 < 9) {
      //   d3.value++;
      // } else {
      //   d4++;
      //   d3(0);
      // }
      // if (d5 < 9) {
      //   d5.value++;
      // } else {
      //   d6++;
      //   d5(0);
      // }
      // if (d6 < 9) {
      //   d6.value++;
      // } else {}
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
              updateLogin();
              //TODO:// todo comment
              // authStatus = AuthStatus.Authenticated;
              // timer.cancel();
              // _isloggedIn(true);
              // timerInit(true);
              // timer = Timer.periodic(1.milliseconds, (timer) {
              //   now(DateTime.now());
              //   if (!isLoggedOut && isloggedIn) updatePercentage();
              // });

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
            timer = Timer.periodic(100.milliseconds, (timer) {
              now(DateTime.now());
              updatePercentage();
            });
          }
        }
      }
    } catch (e) {}
  }

  logout() async {
    apilogout();
    authStatus = AuthStatus.Unauthenticated;
    loggedInTime(0);
    // earning(0);
    breakStarted(BreakStatus.NotStarted);
    _isloggedIn(false);
    _isloggedOut(true);
    timer.cancel();
    timerInit(true);
    d1(0);
    d2(0);
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

  void updateLogin() async {
    try {
      var hour = DateTime.now().hour;
      var minute = DateTime.now().minute;
      var time =
          "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
      var result = await attendaceApi.storeAttendance(
          appSettings.companyId, time, appSettings.candidateId);
      Get.rawSnackbar(message: 'Login Successful.${result.body}');
      appSettings.attendanceId =
          result.body['data']['attendance_id'].toString();
      appSettings.date = now.value.toIso8601String().substring(0, 10);
      authStatus = AuthStatus.Authenticated;
      timer.cancel();
      _isloggedIn(true);
      timerInit(true);

      timer = Timer.periodic(1.seconds, (timer) {
        now(DateTime.now());
        if (!isLoggedOut && isloggedIn) updatePercentage();
      });
    } on BadRequestException catch (e) {
      Get.rawSnackbar(title: e.message, message: e.details.toString());
    } on UnauthorisedException catch (e) {
      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      Get.rawSnackbar(message: 'Something went wrong.');
    }
  }

  void apilogout() async {
    try {
      var body = {'earning': earning.value};
      var attendanceId = appSettings.attendanceId;
      var companyId = appSettings.companyId;
      var result = await attendaceApi.logout(body, companyId, attendanceId);
      Get.rawSnackbar(message: 'Logout Successful.${result.body}');
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
  }

  void startBreakSubmit() async {
    var attendanceId = appSettings.attendanceId;
    try {
      var res = await attendaceApi.breakStore({}, attendanceId);
      appSettings.breakId = res.body['data']['break_id'].toString();
      print(appSettings.breakId);
      print(res.body.toString());
      Get.rawSnackbar(message: 'Break Submitted.${res.body} ');
    } catch (e) {
      Get.rawSnackbar(message: 'Break Submit Failed. ');
    }
  }

  void stopBrakSubmit() async {
    var breakId = appSettings.breakId;
    print(breakId);
    try {
      var res = await attendaceApi.breakUpdate({}, breakId);

      Get.rawSnackbar(message: 'Break Submitted. ');
    } catch (e) {
      Get.rawSnackbar(message: 'Break Submit Failed. ');
    }
  }
}
