import 'package:get/get.dart';
import 'package:hajir/app/modules/login/models/carousel_item.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _selectedItem = 0.obs;
  get selectedItem => _selectedItem.value;
  set selectedItem(value) => _selectedItem.value = value;
  var isEmployer = false.obs;
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
}
