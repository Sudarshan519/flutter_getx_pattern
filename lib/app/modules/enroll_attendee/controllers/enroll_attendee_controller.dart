import 'package:get/get.dart';

class EnrollAttendeeController extends GetxController {
  //TODO: Implement EnrollAttendeeController

  final count = 0.obs;
  final _selected = 0.obs;
  int get selected => _selected.value;
  set selected(int selected) => _selected(selected);



  void increment() => count.value++;
}
