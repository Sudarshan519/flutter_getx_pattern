import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/employer_dashboard/controllers/employer_dashboard_controller.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';

class CreateCompanyController extends GetxController {
  //TODO: Implement CreateCompanyController
  final AttendanceSystemProvider attendanceApi = Get.find();
  final count = 0.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address = TextEditingController();
  final workingDays = TextEditingController();
  final officeHourStart = '8:00'.obs;
  var companyWorkingDays = <String>[].obs;
  final officeHourEnd = '18:00'.obs;
  final code = ''.obs;
  final calculation_type = '30 days'.obs;
  final networkIp = TextEditingController();
  final salaryType = 'monthly'.obs;
  final governmentLeaveDates = <String>[].obs;
  final specialLeaveDates = <String>[].obs;
  final networkType = 'any'.obs;

  var codeType = 'auto'.obs;
  var loading = false.obs;

  var sickLeaveType = "".obs;
  var sickLeaveDays = "".obs;

  var probationPeroid = "".obs;
  addCompany() async {
    var body = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "address": address.text,
      "working_days": 6,
      "office_hour_start": officeHourStart.value,
      "office_hour_end": officeHourEnd.value,
      // "calculation_type": calculation_type.value,
      "network_ip": networkIp.text,
      "salary_type": salaryType.value, "sick_leave_type": sickLeaveType.value,
      'sick_leave_days': sickLeaveDays.value,

      "probation_peroid": probationPeroid.value,
      "government_leavedates": [
        ...governmentLeaveDates.map((e) => {"leave_date": e})
      ],
      "special_leavedates": [
        ...specialLeaveDates.map((e) => {"leave_date": e})

        // {"leave_date": "04/04/2017"},
        // {"leave_date": "04/04/2018"}
      ]
    };
    if (calculation_type.value == 'calendar_days') {
      // "code": "C-0967",
      body["calculation_type"] = "calendar_days";
    }
    if (code.value != '' && codeType.value == 'custom') {
      body["code"] = code.value;
    }
    // if (governmentLeaveDates.isNotEmpty) {
    //   body["government_leavedates"] = [
    //     ...governmentLeaveDates.map((e) => {"leave_date": e})
    //   ]
    //       // {"leave_date": "04/04/2017"},
    //       // {"leave_date": "04/04/2018"}
    //       ;
    // }
    // if (specialLeaveDates.isNotEmpty) {
    //   body["special_leavedates"] = [
    //     ...specialLeaveDates.map((e) => {"leave_date": e})
    //     // {"leave_date": "04/04/2017"},
    //     // {"leave_date": "04/04/2018"}
    //   ];
    // }
    loading(true);

    try {
      showLoading();
      // await Future.delayed(3.seconds);
      print(body);
      await attendanceApi.addCompany(body);
      Get.back();
      EmployerDashboardController controller = Get.find();
      controller.getCompanies();
      Get.back();
    } on BadRequestException catch (e) {
      Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      Get.back();

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
    loading(false);
    // print(body);
    // attendanceApi.addCompany(body);
  }

  void increment() => count.value++;
}
