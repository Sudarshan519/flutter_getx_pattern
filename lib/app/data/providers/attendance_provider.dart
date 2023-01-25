import 'package:get/get.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';

class BaseResponse {
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
  @override
  void onInit() {
    httpClient.baseUrl = 'https://attendance.an4soft.com/api/';
  }

  // dynamic _returnResponse(Response<dynamic> response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       return response.body;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 401:
  //     case 403:
  //       throw UnauthorisedException(response.body.toString());
  //     case 404:
  //       throw BadRequestException('Not found');
  //     case 500:
  //       throw FetchDataException('Internal Server Error');
  //     default:
  //       throw FetchDataException(
  //           'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  //   }
  // }

  Future<BaseResponse> login(String phone, String otp) async {
    var body = {'phone': phone, 'password': otp};
    var res = await post('candidate/login', body);
    return parseRes(res);
  }

  /// candidate
  Future<BaseResponse> register(String phone) async {
    var body = {'phone': phone};
    try {
      var res = await post('candidate/register', body);

      return parseRes(res);
    } catch (e) {
      // print(e.toString());
      rethrow;
      //  throw ServerException(e.toString());
      // return BaseResponse(message: "Something went wrong", statusCode: 400);
    }
  }

  ///
  Future<BaseResponse> verifyOtp(String phone, String code,
      {bool isEmployer = false}) async {
    var body = {'phone': phone, 'otp': code};
    // var body = {'phone': '9863450102', 'otp': '5827'};
    try {
      var res = await post('candidate/verify-opt', body, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      });

      return parseRes(res);
    } catch (e) {
      Get.log(e.toString());
      rethrow;
    }
  }

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
    var body = {
      'phone': phone,
    };

    var res = await post('employer/register', body);

    return parseRes(res);
  }

  verifyEmployerOtp(String phone, String otp) async {
    var body = {'phone': phone, 'otp': otp};
    log(body.toString());
    try {
      var res = await post('employer/verify-opt', body);
      print(res.body);
      return parseRes(res);
    } catch (e) {
      rethrow;
    }
  }

  addCandidate() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
    try {
      var body = {
        "name": "teach",
        "address": "nepal",
        "contact": "9865456587",
        "email": "teach@gmail.com",
        "office_hour_start": "8:00",
        "office_hour_end": "18:00",
        "salary_type": "monthly",
        "duty_time": "8:00",
        "code": "RT2209",
        "dob": "2004-12-18",
        "salary_amount": "20000",
        "joining_date": "2018-02-03",
        "over_time": "1.5"
      };

      var res = await post('localhost:8000/api/candidate/store/1', body,
          headers: headersList);
      if (res.statusCode! >= 200 && res.statusCode! < 300) {}
    } catch (e) {}
  }

  getCandidates() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
    try {
      var res = await get('localhost:8000/api/candidate/get-candidates/1',
          headers: headersList);
    } catch (e) {}
  }

  addCompany() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
    var url = 'localhost:8000/api/employer/company/store';

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

  getCompanies() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
    var url = ('localhost:8000/api/employer/company/all');

    var res = await get(url);

    if (res.statusCode! >= 200 && res.statusCode! < 300) {
    } else {}
  }

  getCompanyById() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmM5MjBkNDZlMzNlZWMzZGIxOTE3NTVlMjM0OTNlMDc1NWQ0NGFiY2Y3OTExYzhmOTYwMDY4NTZhMzYxZDI3YzkxYTk5ODdlZTI0NjMyNTciLCJpYXQiOjE2NzM5MzE0MzYuNjA4MzgxLCJuYmYiOjE2NzM5MzE0MzYuNjA4Mzg1LCJleHAiOjE3MDU0Njc0MzYuNTY4OTgzLCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.DIW2d5INcatNusuPw8DMtOl_qY-fyhHfII2AJugcuxgUflQhyo4fTL-L9rP9TZSfnv5B5EHM64y3DcJtA1Fze89cUKd1ANCou0jOuhKnUVOSwlyYBB_2UUYV1lrwF82oAiSVqvr5yLIilLEqR64Hyxk_ZUiivnn9HZ0hE85Bdd_0y2r3vj7iAjomztW7mIFsCHTxn4gM9FguloK3v0dtv_YN2n5fGVvOekT-tA1QKRQVJ1IcPfkWtPr9ufRT9_OBeROlGZMzY0UdgbTwtR6RijZ1KKLf5JqeTzhgR3Q3LA3awpAVHA2ub1fcD5RJXomQdIRkZJ5tnmc09lrlxWL9QPzRZOgMwk8FpcTpn8z0yFPPIlZPcPxCwA7x-ytoSkA9nLy-a47dZLNIxLpbMnrgpHspgMk-21KqOz-RpLeBr0TKnrIngFkp7ZIBnWvTdBe_g6b0q1jCx-ChyQV3rECbIeIHafcnsj4tBh4ZyZuzwkXQ3nrOIrNPWMMPYMJ_Ib2p1yPXx4LlsmUXcDUyiXmn9KIC1EQ3jxfg62wZI8FH5EUzt_ETZ2kKqqsq4RZnP0ehCEFeebvSBwAqbkY3QxXbaEKtRcCiawjxhmQMXk9cw4X27oc0lVHbCKD70A803cVpv_AFeuQi20fNUUEKGA6zu1gSP8HsGHZtShpGhynWc4g'
    };

    var url = ('localhost:8000/api/company/get-companies/1');

    var res = await get(url, headers: headersList);

    if (res.statusCode! >= 200 && res.statusCode! < 300) {
    } else {}
  }

  updateCompanyById() async {
    var headersList = {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
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
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTA5MDY1YjAyMjk1YzAwYmY1NTE4MjAyOWQzZTY2ZmU2NTM5Mjk5YjlmMzljMmFiYzllMjM5NmRiNTEwOGNjZDAzMTQ4NzdlMDUwZTljZWQiLCJpYXQiOjE2NzM5NDU0MTEuMjU3OTA4LCJuYmYiOjE2NzM5NDU0MTEuMjU3OTExLCJleHAiOjE3MDU0ODE0MTEuMjUyODIsInN1YiI6IjIiLCJzY29wZXMiOltdfQ.e7f9iwjTyjj34U51p1ggpmM72NNdQgi7nkid_58f0VB1HSo9Xpy2vnQhkP2kr-k2kKAFrznmSCGyNWJQZr8lwyVAxy4J84NNME_roJqLXoQ7p0U4iTYhV4OunuIPT4_nm8wEWAfzDhK_fDlXVJVbMnLxRLYFxvFYPu-oh1URNnSFFm3bzZwdVvXHYa-TZJsugxPd7M30dclgwt1jTddMMNKu_b8zUQUk8n1aLBMravF9ZbwOA2FzZ0RenfPrXbVIQrpnzWEmIDv72qnwuVFBYDyqgTeOj7ZgEKt6EDB1A48vMyIhYzIl5wnthEWkilEe4uamNvVat7Q_XtluxMzvkvTVj2SaxIHds3-DqJ9ZVMQgT2qUxa-J8vRb7D-9peQnYS5upcMLTNbHTAM4bF6k5hOKRNCdtqiHQFpIDwuXVCu9Jh_YK7Lg0Ig5rXt9_1aIOsGKm4lQqFBP0jsl3LsdAgtiedMhQ6uXF0gLwCBuLVU2G_jVSUrOABN0w80Pby75myMQh7pY2Siic1G2ZHtRWjA2OrRY7Jn3P1sP1W7_zv1mtCFygIW5rmPlLFxkdNFpnYcncOChFXsLxk6yfrMCiW7svdu-Ae463XephD7OxrFyHYY8qvbw62BlbZHKkNXMqBDhLlTTVogFC1Npz36hAhPU2IRCOgyI0HkZuHg7CNE'
    };
    var url = ('localhost:8000/api/company/destroy/1');

    try {
      var res = await get(url);

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
      } else {}
    } catch (e) {}
  }

  requestLeave() async {
    var headersList = {
      'Accept': '*/*',
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
    };
    var url = ('');

    try {
      var res = await post(url, {});

      if (res.statusCode! >= 200 && res.statusCode! < 300) {
      } else {}
    } catch (e) {}
  }

  parseRes(Response res) {
    if (res.statusCode != 200) {
      logRequest(res.request!.url.path, res.body.toString());
    }
    // print(res.statusCode);
    switch (res.statusCode) {
      case 200:
        return BaseResponse(body: res.body, statusCode: res.statusCode!);
      case 400:
        Get.log(res.body.toString());
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
