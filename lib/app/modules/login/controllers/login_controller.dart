import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/login/models/carousel_item.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class LoginController extends GetxController {
  final _selectedItem = 0.obs;
  get selectedItem => _selectedItem.value;
  set selectedItem(value) => _selectedItem.value = value;
  var isEmployer = false.obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();

  final AttendanceSystemProvider attendanceApi = Get.find();
  var candidateItems = <LoginItem>[
    LoginItem(
        icon: "assets/Group 87.png", label: strings.login_candidate_item1),
    LoginItem(
        icon: "assets/Group 91.png", label: strings.login_candidate_item2),
    LoginItem(
        icon: "assets/Group 92.png", label: strings.login_candidate_item3),
  ];
  var employerItems = <LoginItem>[
    LoginItem(icon: "assets/Group 87.png", label: strings.login_employer_item1),
    LoginItem(icon: "assets/Group 91.png", label: strings.login_employer_item2),
    LoginItem(icon: "assets/Group 92.png", label: strings.login_employer_item3),
  ];
  @override
  void onInit() {
    super.onInit();
    isEmployer(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => _selectedItem.value++;

  void registerPhone() async {
    try {
      showLoading();
      await attendanceApi.register(phone.text);

      Get.back();

      Get.toNamed(Routes.MOBILE_OPT, arguments: [isEmployer.value, phone]);
    } on BadRequestException catch (e) {
      Get.back();
      // if (kDebugMode) {
      //   Get.toNamed(Routes.MOBILE_OPT,
      //       arguments: [isEmployer.value, phone.text]);
      // } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red.shade800,
        title: e.message,
        message: e.details.toString(),
      );
      // }
    } on ServerException catch (e) {
      Get.back();
      Get.rawSnackbar(
        title: e.statusCode,
        message: e.message.toString(),
      );
    } catch (e) {
      Get.back();
      switch (e) {
        case BadRequestException:
          e as BadRequestException;
          Get.rawSnackbar(message: e.details);
          break;
        case ServerException:
          e as BadRequestException;
          Get.rawSnackbar(message: e.message);

          break;
        default:
      }
    }
  }
}

void showLoading() {
  Get.dialog(AlertDialog(
    content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Center(child: CircularProgressIndicator())]),
  ));
}
