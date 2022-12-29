import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _selectedItem = 0.obs;
  get selectedItem => _selectedItem.value;
  set selectedItem(value) => _selectedItem.value = value;
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

  void increment() => _selectedItem.value++;
}
