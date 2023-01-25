import 'package:get/get.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  final _isEmployed = false.obs;
  bool get isEmployed => _isEmployed.value;
  set isEmployed(bool userEmploymentStatus) =>
      _isEmployed(userEmploymentStatus);
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  final _isInvited = false.obs;
  bool get isInvited => _isInvited.value;
  set isInvited(bool isUserInvited) => _isInvited(true);

  var selectedWeek = 0.obs;
  var selectedReport = 0.obs;

  var selectedMonth = 0.obs;
  var selectedYear = 0.obs;
  final _dob = ''.obs;
  set dob(String db) => _dob(db);
  String get dob => _dob.value;
  listenForInvitation() {
    Future.delayed(3.seconds, () {
      isInvited = true;
    });
  }

  acceptInvitation() {
    isEmployed = true;
  }

  @override
  void onInit() {
    super.onInit();
    var now = DateTime.now();
    selectedYear(now.year);
    selectedMonth(now.month);
    listenForInvitation();
  }

  logout() async {
    appSettings.logout();
    Get.toNamed(Routes.LANGUAGE);
  }

  void increment() => count.value++;
}
