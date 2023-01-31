import 'package:get/get.dart';

import '../controllers/candidatecompanies_controller.dart';

class CandidatecompaniesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CandidatecompaniesController>(
      () => CandidatecompaniesController(),
    );
  }
}
