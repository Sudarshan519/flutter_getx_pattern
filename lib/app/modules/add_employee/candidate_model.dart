class Candidate {
  String? name;
  String? address;
  String? contact;
  String? email;
  String? officeHourStart;
  String? officeHourEnd;
  String? salaryType;
  String? dutyTime;
  String? code;
  String? dob;
  String? salaryAmount;
  String? joiningDate;
  String? overTime;
  String? allowLateAttendance;
  String? designation;
  Candidate(
      {this.name,
      this.address,
      this.contact,
      this.email,
      this.officeHourStart,
      this.officeHourEnd,
      this.salaryType,
      this.dutyTime,
      this.code,
      this.dob,
      this.salaryAmount,
      this.joiningDate,
      this.allowLateAttendance,
      this.overTime});

  Candidate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contact = json['contact'];
    email = json['email'];
    officeHourStart = json['office_hour_start'];
    officeHourEnd = json['office_hour_end'];
    salaryType = json['salary_type'];
    dutyTime = json['duty_time'];
    code = json['code'];
    dob = json['dob'];
    salaryAmount = json['salary_amount'];
    joiningDate = json['joining_date'];
    overTime = json['over_time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['contact'] = contact;
    data['email'] = email;
    data['office_hour_start'] = officeHourStart;
    data['office_hour_end'] = officeHourEnd;
    data['salary_type'] = salaryType;
    data['duty_time'] = dutyTime;
    data['code'] = code;
    data['dob'] = dob;
    data['salary_amount'] = salaryAmount;
    data['joining_date'] = joiningDate;
    data['over_time'] = overTime;
    data['designation']=designation;
    data['allow_late_attendance'] = allowLateAttendance;
    return data;
  }
}
