import 'dart:convert';

import 'package:flutter/foundation.dart';

class Companies {
  List<CompanyModel> companies;
  Companies({
    required this.companies,
  });

  Companies copyWith({
    List<CompanyModel>? companies,
  }) {
    return Companies(
      companies: companies ?? this.companies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companies': companies.map((x) => x.toJson()).toList(),
    };
  }

  factory Companies.fromMap(Map<String, dynamic> map) {
    return Companies(
      companies: List<CompanyModel>.from(
        (map['companies'] as List<int>).map<CompanyModel>(
          (x) => CompanyModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Companies.fromJson(String source) =>
      Companies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CompanyList(companies: $companies)';

  @override
  bool operator ==(covariant Companies other) {
    if (identical(this, other)) return true;

    return listEquals(other.companies, companies);
  }

  @override
  int get hashCode => companies.hashCode;
}

class CompanyModel {
  int? id;
  String? name;
  String? code;
  String? phone;
  String? address;
  String? working_hours;
  String? office_hour_start;
  String? office_hour_end;
  String? total_employee;
  String? total_approver;
  String? salary_type;
  String? duty_time;
  String? overtime;
  String? salry_amount;
  String? createdAt;
  String? updatedAt;

  CompanyModel({this.id, this.name, this.total_employee, this.total_approver});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    working_hours = json['working_hours'];
    office_hour_start = json['office_hour_start'];
    office_hour_end = json['office_hour_end'];
    salary_type = json['salary_type'];
    duty_time = json['duty_time'];
    overtime = json['overtime'];
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
