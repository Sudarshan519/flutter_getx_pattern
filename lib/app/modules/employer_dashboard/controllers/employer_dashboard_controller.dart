import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';

class EmployerDashboardController extends GetxController {
  //TODO: Implement EmployerDashboardController
  final AttendanceSystemProvider attendanceApi = Get.find();
  var isEmployed = false;
  var loading = false.obs;

  final selectedIndex = 0.obs;
  var companyList = <CompanyModel>[].obs;
  final _selected = 0.obs;

  var selected_payments_options = 0.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected(value);
  var selectedWeek = 0.obs;
  var selectedDay = 0.obs;
  var selectedYear = 0.obs;
  var selectedMonth = 0.obs;
  var selectedReport = 0.obs;
  var myPlan = "Free(Forever)".obs;

  final _dob = ''.obs;
  set dob(String db) => _dob(db);
  String get dob => _dob.value;
  getCompanies() async {
    companyList.clear();
    loading(true);

    try {
      var result = await attendanceApi.getEmployerCompanies();
      // print(result.body['data']);
      result.body['data']['companies']
          .forEach((e) => companyList.add(CompanyModel.fromJson(e)));
    } on BadRequestException catch (e) {
      loading(false);
      Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      log(e.toString());
      loading(false);

      Get.back();

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
    loading(true);
    // companyList(companies);
  }

  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  void increment() => selectedIndex.value++;
}
