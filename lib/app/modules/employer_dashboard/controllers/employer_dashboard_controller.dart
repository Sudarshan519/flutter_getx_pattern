import 'package:get/get.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';

class EmployerDashboardController extends GetxController {
  //TODO: Implement EmployerDashboardController

  final selectedIndex = 0.obs;
  var companyList = <CompanyModel>[].obs;

  addCompany() {
    companyList(companies);
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

  void increment() => selectedIndex.value++;
}
