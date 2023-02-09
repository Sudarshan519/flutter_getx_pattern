import 'package:get/get.dart';
import 'package:hajir/app/data/models/user.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_provider.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
import 'package:hajir/app/modules/notifications/controllers/notifications_controller.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

class DashboardController extends GetxController {
  final attendanceApi = Get.find<AttendanceSystemProvider>();
  final notificationController = Get.find<NotificationsController>();
  final count = 0.obs;
  final _isEmployed = false.obs;
  bool get isEmployed => _isEmployed.value;
  final _selectedCompany = ''.obs;
  String get companySelected => _selectedCompany.value;
  set companySelected(String id) => _selectedCompany(id);
  set isEmployed(bool userEmploymentStatus) =>
      _isEmployed(userEmploymentStatus);
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  final _isInvited = false.obs;
  bool get isInvited => _isInvited.value;
  set isInvited(bool isUserInvited) => _isInvited(true);

  var selectedWeek = 0.obs;
  // var selectedReport = 0.obs;

  var selectedMonth = 0.obs;
  var selectedYear = 0.obs;
  final _dob = ''.obs;
  set dob(String db) => _dob(db);
  String get dob => _dob.value;
  var invitationlist = [].obs;
  var loading = false.obs;
  var user = UserModel().obs;
  updateProfile(String fname, String email, String phone) async {
    try {
      showLoading();
      var result = await attendanceApi.updateProfile({
        'firstname': fname,
        'lastname': fname.split(' ').last,
        'email': email,
        'dob': dob.replaceAll('-', '/')
      });

      appSettings.name = fname;
      appSettings.email = email;
      user.value.email = email;
      user.value.name = fname;
      user(UserModel(name: fname, email: email, phone: phone));
      Get.back();
      Get.back();
      Get.rawSnackbar(message: result.body.toString());
    } on UnauthorisedException catch (e) {
      loading(false);

      Get.rawSnackbar(title: e.message, message: e.details.toString());
    } on BadRequestException catch (e) {
      loading(false);
      Get.rawSnackbar(title: e.message, message: e.details.toString());
    } catch (e) {
      Get.rawSnackbar(title: e.toString());
      handleExcpt(e);
      log(e.toString());
      loading(false);

      // Get.back();

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
  }

  getInvitations() async {
    try {
      loading(true);
      if (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }
      var res = await attendanceApi.candidateInvitations();

      print(res.body);
      invitationlist(res.body['data']['candidateInvitations']);

      loading(false);
      // var invitation = invitationlist
      //     .firstWhereOrNull((element) => element['status'] == 'Approved');
      // if (invitation != null) {
      //   isEmployed = true;
      //   appSettings.isEmployed = true;
      //   appSettings.companyId = invitation['company']['id'].toString();
      //   // print(invitation);
      // }
    } on BadRequestException catch (e) {
      loading(false);
      // Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      log(e.toString());
      loading(false);

      // Get.back();

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
  }

  acceptInvitation(String invitationId, String companyId) async {
    try {
      loading(true);
      if (Get.isSnackbarOpen) {
        await Get.closeCurrentSnackbar();
      }
      print(invitationId);
      var res = await attendanceApi.acceptInvitation(invitationId);
      print(res.body);
      isEmployed = true;
      appSettings.isEmployed = true;
      appSettings.companyId = companyId;
      // invitationlist(res.body['data']['candidateInvitations']);

      loading(false);
    } on BadRequestException catch (e) {
      loading(false);
      // Get.back();

      Get.rawSnackbar(title: e.message, message: e.details);
    } catch (e) {
      log(e.toString());
      loading(false);

      Get.rawSnackbar(message: "Something Went Wrong".toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    appSettings.employer = false;
    user(appSettings.getuser());
    // appSettings.isEmployed = false;
    isEmployed = appSettings.isEmployed;

    var now = DateTime.now();
    selectedYear(now.year);
    selectedMonth(now.month);
    selectedWeek(now.day ~/ 7);
    if (!appSettings.isEmployed) {
      // print(appSettings.token);
      getInvitations();
    }
  }

  logout() async {
    appSettings.logout();
    Get.toNamed(Routes.LANGUAGE);

    Get.deleteAll();
  }

  void increment() => count.value++;

  void handleExcpt(Object e) {
    print(e == UnauthorisedException);
    switch (e) {
      case UnauthorisedException:
        e as UnauthorisedException;
        Get.rawSnackbar(title: e.message, message: e.details);
        break;
      default:
        e as UnauthorisedException;
        Get.rawSnackbar(title: e.message, message: e.details);
    }
  }

  void changeCompany(String id) {
    appSettings.companyId = id;
    companySelected = id;
  }
}
