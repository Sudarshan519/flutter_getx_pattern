import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/modules/login/models/carousel_item.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class LoginController extends GetxController {
  final _selectedItem = 0.obs;
  get selectedItem => _selectedItem.value;
  set selectedItem(value) => _selectedItem.value = value;
  var isEmployer = false.obs;
  final AttendanceSystemProvider attendanceApi = Get.find();
  var candidateItems = <LoginItem>[
    LoginItem(
        icon: "assets/Group 87.png", label: strings.login_candidate_item1),
    LoginItem(
        icon: "assets/Group 91.png", label: strings.login_candidate_item2),
    LoginItem(
        icon: "assets/Group 92.png", label: strings.login_candidate_item3),
  ];
  var employerItems = <LoginItem>[
    LoginItem(icon: "assets/Group 87.png", label: strings.login_employer_item1),
    LoginItem(icon: "assets/Group 91.png", label: strings.login_employer_item2),
    LoginItem(icon: "assets/Group 92.png", label: strings.login_employer_item3),
  ];
  @override
  void onInit() {
    super.onInit();
    isEmployer(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => _selectedItem.value++;

  void registerPhone({required String phone}) async {
    try {
      var resp = await attendanceApi.register(phone);

      Get.toNamed(Routes.MOBILE_OPT, arguments: [isEmployer.value, phone]);
    } on ValidatorException catch (e) {
      Get.rawSnackbar(
        title: e.message,
        message: e.data.toString(),
      );
    } catch (e) {}
  }
}
