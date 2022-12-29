import 'package:get/get.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController

  final count = 0.obs;
  final selectedItem = 0.obs;
  final carouselItems = [
    """Hajir will help you to manage your 
staff’s attendance, payrole and personal
report of your company.""",
    """Candidate can login and logout
on official hours and employer can notice
staffs activities and generate reports.""",
    """Salary calculation made easy, track your
staffs overtime, leave day, late day and
live daily wages interactive reports."""
  ];
  @override
  void onInit() {
    super.onInit();
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
