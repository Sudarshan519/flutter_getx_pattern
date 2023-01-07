import 'package:get/get.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';

class CompanyDetailController extends GetxController {
  //TODO: Implement CompanyDetailController

  final selectedItem = 0.obs;
  var company = CompanyModel().obs;
  var candidates = <EmployeeModel>[].obs;
  var loading = false.obs;

  var _selected = 0.obs;
  int get selected => _selected.value;
  set selected(int value) => _selected(value);
  var selectedWeek = 0.obs;
  var selectedDay = 0.obs;
  var selectedYear = 0.obs;
  var selectedMonth = 0.obs;
  var selectedReport = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loading(true);
    company(Get.arguments);
    loading(false);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => selectedItem.value++;

  void addEmployee() {
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
    this.id = json['id'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
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
