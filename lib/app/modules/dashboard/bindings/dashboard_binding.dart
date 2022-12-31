import 'package:get/get.dart';
import 'package:hajir/app/modules/candidate_login/controllers/candidate_login_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<CandidateLoginController>(
      () => CandidateLoginController(),
    );
  }
}
