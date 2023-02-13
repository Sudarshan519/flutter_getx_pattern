import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/add_employee/candidate_model.dart';
import 'package:hajir/app/modules/add_employee/providers/candidate_provider.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';

class AddEmployeeController extends GetxController {
  final candidateProvider = Get.find<CandidateProvider>();
  final AttendanceSystemProvider attendaceApi = Get.find();
  final name = TextEditingController();
  final code = TextEditingController();
  final contact = TextEditingController();
  final address = TextEditingController();
  final salaryAmount = TextEditingController();
  final dob = ''.obs;
  final count = 0.obs;
  final email = TextEditingController();
  var officeHourStart = '08:00'.obs;
  var officeHourEnd = '18:00'.obs;
  final salaryType = TextEditingController()..text = 'monthly';
  final joiningDate = DateTime.now().toIso8601String().substring(0, 10).obs;
  final dutyTime = TextEditingController()..text = '8';
  final overTime = TextEditingController();
  final breakStart = '13:00'.obs;
  final breakEnd = '13:45'.obs;
  var hasOvertimerRatio = false.obs;

  var designation = TextEditingController();

  var phone = TextEditingController();

  var loading = false.obs;
  var args = ''.obs;
  addCadidate() async {
    loading(true);
    final candidate = Candidate()
      ..name = name.text
      ..address = address.text
      ..code = code.text
      ..contact = phone.text
      ..officeHourStart = officeHourStart.value
      ..officeHourEnd = officeHourEnd.value
      ..email = email.text
      ..dob = dob.value
      ..salaryType = salaryType.text
      ..salaryAmount = salaryAmount.text
      ..joiningDate = joiningDate.value
      ..dutyTime = dutyTime.text
      ..overTime = overTime.text;
    try {
      showLoading();
      await attendaceApi.addCandidate(candidate.toJson(), args.value);
      Get.back();
      Get.back();
      Get.find<CompanyDetailController>().getallCandidates();
      Get.rawSnackbar(message: "Successfully Created");
    } on UnauthorisedException catch (e) {
      Get.back();
      Get.rawSnackbar(message: e.details);
    } catch (e) {
      Get.back();
      Get.rawSnackbar(message: e.toString());
      // log(e.toString());
    }
    loading(false);
  }

  @override
  void onInit() {
    super.onInit();

    loading(true);
    args(Get.arguments);

    loading(false);
  }

  void increment() => count.value++;
}
