import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';

class CompanyDetailController extends GetxController {
  //TODO: Implement CompanyDetailController

  final selectedItem = 2.obs;
  var company = CompanyModel().obs;
  var candidates = <EmployeeModel>[].obs;
  var loading = false.obs;
  var myPlan = "Free(Forever)".obs;
  final _selected = 0.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected(value);
  var selectedWeek = 0.obs;
  var selectedDay = 0.obs;
  var selectedYear = 0.obs;
  var selectedMonth = 0.obs;
  var selectedReport = 0.obs;
  var invitationlist = [].obs;
  var params = {}.obs;
  final attendanceApi = Get.find<AttendanceSystemProvider>();
  @override
  void onInit() {
    super.onInit();
    getallCandidates();
    // getEmployee();
    // loading(true);
    company(Get.arguments);
    params(Get.parameters);
    // loading(false);
  }

  void increment() => selectedItem.value++;
  getallCandidates() async {
    loading(true);
    var companyId = (Get.parameters['company_id']);
    // invitationlist.clear();
    try {
      var allcandidates =
          await attendanceApi.getAllInvitationList(companyId.toString());
      invitationlist(allcandidates.body['data']['users']);
      // Get.back();
      // print(invitationlist.body);
    } on BadRequestException catch (e) {
      loading(false);
      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      log(e.toString());
      loading(false);

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
    loading.value = false;
  }

  void getEmployee() {
    loading(true);
    Future.delayed(2.seconds, () {
      candidates(employeeList);
      loading(false);
    });
  }

  sendInvitation(String candidateId) async {
    try {
      if (loading.isFalse) {
        showLoading();
        if (Get.isSnackbarOpen) {
          await Get.closeCurrentSnackbar();
        }
      }
      var result = await attendanceApi.sendInvitation(
          params['company_id'], candidateId, 'Not-Approved');

      // Get.back();
      Get.back();

      Get.rawSnackbar(message: result.body.toString());
      getallCandidates();
    } on BadRequestException catch (e) {
      // loading(false);
      Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      log(e.toString());
      // loading(false);

      Get.back();

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
    // loading.value = false;
  }

  void removeEmployee(String candidateId) async {
    showLoading();
    if (Get.isSnackbarOpen) {
      await Get.closeCurrentSnackbar();
    }
    try {
      var result = await attendanceApi.deleteInvitation(
        params['company_id'],
        candidateId,
      );
      Get.back();

      Get.rawSnackbar(message: result.body.toString());
      getallCandidates();
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
  }
}

class EmployeeModel {
  int? id;
  String? name;

  EmployeeModel({this.id, this.name});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

var employeeList = <EmployeeModel>[
  EmployeeModel(name: "Nitesh Shrestha"),
  EmployeeModel(name: "Ashish Shrestha"),
  EmployeeModel(name: "Gopal Shrestha"),
  EmployeeModel(name: "Suman Shrestha"),
  EmployeeModel(name: "Nitesh Shrestha"),
];
