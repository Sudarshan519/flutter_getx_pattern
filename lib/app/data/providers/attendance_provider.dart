import 'dart:io';

import 'package:get/get.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/dashboard/views/apply_leave.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

class BaseResponse {
  handle<T>({required onSuccess, required onFailue}) {
    switch (statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.accepted:
      case HttpStatus.nonAuthoritativeInformation:
      case HttpStatus.noContent:
      case HttpStatus.resetContent:
      case HttpStatus.partialContent:
        return onSuccess();
      case 400:
      case 401:
        return onFailue();
    }
  }

  dynamic body;
  String? message;
  int statusCode;
  BaseResponse({this.body, this.message, required this.statusCode});
}

class ServerException implements Exception {
  String? message;
  String? statusCode;
  ServerException([this.message, this.statusCode]);
}

class ValidatorException implements Exception {
  String? message;
  int? statusCode;
  dynamic data;
  ValidatorException([this.message, this.statusCode, this.data]);
}

class AttendanceSystemProvider extends GetConnect {
  get headersList => globalHeaders;

  @override
  void onInit() {
    httpClient.baseUrl = 'https://attendance.an4soft.com/api/';
    // globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
  }

  Future<BaseResponse> candidateInvitations() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/invitation/all';
    var res = await get(url, headers: globalHeaders);
    return parseRes(res);
  }

  Future<BaseResponse> candidateCompanies() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/get-companies';
    var res = await get(url, headers: headersList);
    return parseRes(res);
  }

  Future<BaseResponse> acceptInvitation(String invitationId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var res = await post('candidate/invitation/invitation-update/$invitationId',
        {'status': 'Approved'},
        headers: globalHeaders);
    return parseRes(res);
  }

  Future<BaseResponse> storeAttendance(
      String companyId, String time, String candidateId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/attendance-store/$companyId';
    var body = {'attendance_time': time, 'candidate_id': candidateId};

    var res = await post(url, body, headers: headersList);
    return parseRes(res);
  }

  Future<BaseResponse> login(String phone, String otp) async {
    var body = {'phone': phone, 'password': otp};
    var res = await post('candidate/login', body, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    });
    return parseRes(res);
  }

  /// candidate
  Future<BaseResponse> register(String phone) async {
    var body = {'phone': phone};

    var res = await post('candidate/register', body,
        headers: {'accept': 'application/json'});

    return parseRes(res);
  }

  ///
  Future<BaseResponse> verifyOtp(String phone, String code) async {
    var body = {'phone': phone, 'otp': code};

    var res = await post('candidate/verify-opt', body, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    });

    return parseRes(res);
  }

  // Future<BaseResponse> invitations() async {
  //   var url = "/candidate/invitation/all";
  //   var res = await get(url, headers: headersList);
  //   return parseRes(res);
  // }

  ///Employer login
  ///
  Future<BaseResponse> loginEmployer(String phone, String otp) async {
    var body = {'phone': phone, 'otp': otp};

    try {
      var res = await post('/employer/verify-opt', body);
      return parseRes(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse> registerEmployer(
    String phone,
  ) async {
    var body = {'phone': phone};

    var res = await post('employer/register', body, headers: headersList);

    return parseRes(res);
  }

  verifyEmployerOtp(String phone, String otp) async {
    var body = {'phone': phone, 'otp': otp};
    log(body.toString());
    try {
      var res = await post('employer/verify-opt', body);
      return parseRes(res);
    } catch (e) {
      rethrow;
    }
  }

  addCandidate(var body, String id) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var res = await post('employer/candidate/store/$id', body,
        headers: globalHeaders);

    return parseRes(res);
  }

  addCompany(dynamic body) async {
    var url = 'employer/company/store';
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    // try {
    var res = await post(url, body, headers: globalHeaders);
    log(res.bodyString!);
    return parseRes(res);
    // } catch (e) {
    //   rethrow;
    // }
  }

  Future<BaseResponse> getEmployerCompanies() async {
    // var url = ('employer/company/all');
    var url = 'employer/company/employercompanies';
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';

    var res = await get(url, headers: headersList);

    return parseRes(res);
  }

  getCompanyById() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = ('company/get-companies/1');

    // try {
    var res = await get(url, headers: headersList);
    return parseRes(res);
    // } catch (e) {
    //   rethrow;
    // }
    // if (res.statusCode! >= 200 && res.statusCode! < 300) {
    // } else {}
  }

  updateCompanyById() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = ('localhost:8000/api/employer/company/update/1');

    var body = {
      "name": "company1",
      "email": "company1@gmail.com",
      "phone": "9854789856",
      "address": "nepal",
      "working_days": 6,
      "office_hour_start": "10:00",
      "office_hour_end": "18:00",
      "code": "C-0967",
      "calculation_type": "calendar_days",
      "network_ip": "192.168.10.1",
      "salary_type": "monthly",
      "government_leavedates": [
        {"leave_date": "04/04/2017"},
        {"leave_date": "04/04/2018"}
      ],
      "special_leavedates": [
        {"leave_date": "04/04/2017"},
        {"leave_date": "04/04/2018"}
      ]
    };

    var res = await post(url, body);

    if (res.statusCode! >= 200 && res.statusCode! < 300) {
    } else {}
  }

  deleteCompany() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = ('localhost:8000/api/company/destroy/1');

    try {
      var res = await get(url);

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
      } else {}
    } catch (e) {}
  }

  requestLeave() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = ('');

    try {
      var res = await post(url, {});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
      } else {}
    } catch (e) {}
  }

  Future<BaseResponse> getAllInvitationList(String id) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = ('employer/$id/invitation/all-candidates');

    var res = await get(url, headers: headersList);
    return parseRes(res);
  }

  Future<BaseResponse> getallCandidates(String companyId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/$companyId/invitation/all-candidates';
    var res = await get(url, headers: globalHeaders);
    return parseRes(res);
  }

  Future<BaseResponse> deleteInvitation(
      String companyId, String invitationId) async {
    var url = 'employer/$companyId/invitation/delete/$invitationId';
    var res = await get(url, headers: headersList);

    return parseRes(res);
  }

  Future<BaseResponse> sendInvitation(
      String companyId, String candidateId, var status) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var body = {
      'status': status,
      'candidate_id': candidateId,
      // 'status': status
    };
    var url = 'employer/$companyId /invitation/store';
    var result = await post(url, body, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> updateProfile(var body) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';

    var result =
        await post('candidate/profile-update', body, headers: globalHeaders);

    return parseRes(result);
  }

  Future<BaseResponse> employerUpdateProfile(var body) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var result =
        await post('employer/profile-update', body, headers: globalHeaders);

    return parseRes(result);
  }

  Future<BaseResponse> logout(
      Map<String, double> body, String companyId, String attendanceId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var result = await post(
        'candidate/attendance-update/$companyId/$attendanceId', body,
        headers: headersList);
    return parseRes(result);
  }

  Future<BaseResponse> breakStore(var body, var attendanceId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/attendance-break-store/$attendanceId';
    var result = await post(url, body, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> breakUpdate(var body, var breakId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/attendance-break-update/$breakId';
    var result = await post(url, body, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> allCandidates(String companyId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/candidate/get-candidates/$companyId';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> notifications() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/notifications';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> markRead() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/mark-notification-read';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> markSingleRead(String id) async {
    var url = 'candidate/mark-singlenotification-read/$id';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> changePhoneNumber(var body) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'candidate/change-phonenumber';
    var result = await post(url, body, headers: globalHeaders);
    return parseRes(result);
  }

  Future changeEmployerPhone(var body) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/change-phonenumber';
    var result = await post(url, body, headers: globalHeaders);
    return parseRes(result);
  }

  Future<BaseResponse> getEmployerWeeklyReport() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/change-phonenumber';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  getInactiveCandidates(String companyId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/report/today/inactive-candidate/$companyId';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  getActiveCandidates(String companyId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/report/today/active-candidate/$companyId';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  getCandidateWeeklyReport(String id, String compId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/report/weekly-report/$compId/$id';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }

  getCandidateMonthlyReport(id, compId) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var url = 'employer/report/monthly-report/$compId/$id';
    var result = await get(url, headers: globalHeaders);
    return parseRes(result);
  }
}

parseRes(Response res) {
  // if (res.statusCode != 200) {
  // logRequest(res.request!.url.path, res.body.toString());
  // }
  log(res.request!.url.toString());
  log(res.body.toString());
  switch (res.statusCode) {
    case 200:
    case 201:
      return BaseResponse(body: res.body, statusCode: res.statusCode!);
    case 400:
    case 422:
      throw BadRequestException(res.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(res.body.toString());

    case 404:
      throw BadRequestException('Not found');
    case 500:
      throw FetchDataException('Internal Server Error');
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${res.statusCode}');
  }

  if (res.body != null) {
    if (res.statusCode! >= 200 && res.statusCode! < 300) {
      return BaseResponse(body: res.body, statusCode: res.statusCode!);
    } else {
      throw ValidatorException(res.body['message'], res.statusCode!,
          res.body['data']['phone'].toString());
    }
  } else {
    return BaseResponse(message: "Something went wrong", statusCode: 400);
  }
}

Future<void> logRequest(String url, String body) async {
  // Get.log(body);
  // Get.log(url);
  final httpClient = GetConnect();
  const LOGURL =
      "https://logs-9db58-default-rtdb.firebaseio.com/users/logs.json";
  try {
    await httpClient.post(LOGURL, {
      url.split('/').last: body.toString(),
      "date": DateTime.now().toIso8601String()
    }).then((value) {
      Get.log(value.body.toString());
      Get.log(value.request!.url.path);
    });
  } catch (e) {
    Get.log(e.toString());
  }
}
