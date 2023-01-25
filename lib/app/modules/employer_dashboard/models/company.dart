class CompanyModel {
  int? id;
  String? name;
  String? total_employee;
  String? total_approver;
  String? createdAt;
  String? updatedAt;

  CompanyModel({this.id, this.name, this.total_employee, this.total_approver});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

var companies = [
  CompanyModel(name: "Rasan Tech", total_employee: "24", total_approver: "2"),
  CompanyModel(
      name: "Spark Digital", total_employee: "24", total_approver: "2"),
  CompanyModel(
      name: "DNA Technology", total_employee: "24", total_approver: "2"),
];
