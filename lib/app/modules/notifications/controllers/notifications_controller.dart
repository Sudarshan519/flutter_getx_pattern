import 'package:get/get.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';

class NotificationsController extends GetxController {
  //TODO: Implement NotificationsController
  var notifications = [].obs;
  final count = 0.obs;
  final attendanceApi = Get.find<AttendanceSystemProvider>();
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  getNotifications() async {
    loading(true);
    var result = await attendanceApi.notifications();
    print(result.body);
    loading(false);
    notifications(result.body['data']['notifications']);
  }

  void increment() => count.value++;
}
