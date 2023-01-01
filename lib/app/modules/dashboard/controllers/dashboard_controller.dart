import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
  final _isEmployed = false.obs;
  bool get isEmployed => _isEmployed.value;
  set isEmployed(bool userEmploymentStatus) =>
      _isEmployed(userEmploymentStatus);
  var _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  var _isInvited = false.obs;
  bool get isInvited => _isInvited.value;
  set isInvited(bool isUserInvited) => _isInvited(true);

  var selectedWeek = 0.obs;
  var selectedReport = 0.obs;

  var selectedMonth = 0.obs;
  var selectedYear = 0.obs;
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
