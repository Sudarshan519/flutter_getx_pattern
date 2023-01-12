import 'package:get/get.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';

class EmployerDashboardController extends GetxController {
  //TODO: Implement EmployerDashboardController

  final selectedIndex = 0.obs;
  var companyList = <CompanyModel>[].obs;
  var _selected = 0.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected(value);
  var selectedWeek = 0.obs;
  var selectedDay = 0.obs;
  var selectedYear = 0.obs;
  var selectedMonth = 0.obs;
  var selectedReport = 0.obs;
  var myPlan = "Free(Forever)".obs;
  addCompany() {
    companyList(companies);
  }

  @override
  void onInit() {
    super.onInit();
    addCompany();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => selectedIndex.value++;
}
