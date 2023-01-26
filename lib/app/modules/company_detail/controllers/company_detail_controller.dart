import 'package:get/get.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';

class CompanyDetailController extends GetxController {
  //TODO: Implement CompanyDetailController

  final selectedItem = 1.obs;
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
  var params = {}.obs;
  @override
  void onInit() {
    super.onInit();
    getEmployee();
    loading(true);
    company(Get.arguments);
    params(Get.parameters);
    loading(false);
  }

  void increment() => selectedItem.value++;

  void getEmployee() {
    loading(true);
    Future.delayed(2.seconds, () {
      candidates(employeeList);
      loading(false);
    });
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
