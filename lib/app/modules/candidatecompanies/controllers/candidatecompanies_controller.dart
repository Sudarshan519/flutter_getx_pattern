import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';

class CandidatecompaniesController extends GetxController {
  final count = 0.obs;
  var candidateCompanies = [].obs;

  var loading = false.obs;
  final attendanceApi = Get.find<AttendanceSystemProvider>();
  @override
  void onInit() {
    super.onInit();
    getCompanies();
  }

  void increment() => count.value++;

  void getCompanies() async {
    loading(true);
    candidateCompanies.clear();
    try {
      var result = await attendanceApi.candidateCompanies();
      candidateCompanies(result.body['data']['companies']);
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
   loading(false);
    // print(result.body);
  }
}
