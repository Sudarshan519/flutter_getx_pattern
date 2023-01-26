import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

import '../candidate_model.dart';

class CandidateProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Candidate.fromJson(map);
      if (map is List) {
        return map.map((item) => Candidate.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'https://attendance.an4soft.com/api';
  }

  Future<Candidate?> getCandidate(int id) async {
    final response = await get('candidate/$id');
    return response.body;
  }

  Future<Response<Candidate>> postCandidate(
      Candidate candidate, String companyId) async {
    try {
      var res = await post('/candidate/store/$companyId', candidate.toJson(),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${appSettings.token}'
          });
      print(res.body);
      return parseRes(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteCandidate(int id) async =>
      await delete('candidate/$id');
}
