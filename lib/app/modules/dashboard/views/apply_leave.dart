import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/modules/login/controllers/login_controller.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
import 'package:hajir/app/utils/validators.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

var baseUrl = 'https://attendance.an4soft.com/api/';
var globalHeaders = {
  'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
  'Accept': 'application/json',
  'Content-Type': 'application/json',
};

class ApplyLeaveProvider extends GetConnect {
  @override
  void onInit() {
    var baseUrl = 'https://attendance.an4soft.com/api/';
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = 40.seconds;
  }

  Future<BaseResponse> getAllLeaveTypes() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var res = await get('candidate/leave-types', headers: globalHeaders);
    return parseRes(res);
  }

  Future<BaseResponse> applyLeave(var body) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    var res = await post('candidate/store-leave/${appSettings.companyId}', body,
        headers: globalHeaders);
    print(res.request!.url);
    return parseRes(res);
  }
}

class ApplyLeaveController extends GetxController {
  final ApplyLeaveProvider repository = Get.find();
  final start_date = TextEditingController();
  final end_date = TextEditingController();
  final image = ''.obs;
  final start_time = TextEditingController();
  final remarks = TextEditingController();
  final leave_type = ''.obs;
  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  var selected_leave = ''.obs;
  var allLeaveTypes = [].obs;
  var leave_options = [
    {
      'id': 'Full',
      'title': 'Full Day',
    },
    {'id': "Half", 'title': 'Half Day'}
  ];
  @override
  onInit() {
    super.onInit();
    getAllLeaveTypes();
  }

  getAllLeaveTypes() async {
    try {
      var result = await repository.getAllLeaveTypes();

      allLeaveTypes(result.body['data']['leaveTypes']);
      print(allLeaveTypes.value);
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
  }

  onSubmit() async {
    try {
      var body = {
        'leave_type_id': leave_type.value,
        'remarks': remarks.text,
        'start_date': start_date.text,
        'end_date': end_date.text,
        'type': selected_leave.value
      };
      var formData = FormData(body);
      if (image.value.isNotEmpty) {
        formData.files.add(MapEntry(
            'document',
            MultipartFile(File(image.value),
                filename: image.value.split('.').last)));
      }
      showLoading();
      var result = await repository.applyLeave(formData);
      // print(result.body);
      clearAll();
      Get.back();
      Get.back();
      Get.dialog(const AlertDialog(
        content: ApplySuccess(),
      ));
    } catch (e) {
      log(e.toString());
      Get.back();
      Get.rawSnackbar(message: e.toString());
    }
  }

  void clearAll() {
    leave_type.value = '';
    remarks.clear();
    image('');
    start_date.clear();
    end_date.clear();
  }
}

class ApplyLeave extends GetView<ApplyLeaveController> {
  const ApplyLeave({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    // controller.getAllLeaveTypes();
    return AppBottomSheet(
      child: RPadding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      strings.apply_for_leave,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => DropdownButtonFormField(
                    validator: validateIsEmpty,
                    // value: controller.leave_type.value,
                    isDense: true,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        hintText: controller.allLeaveTypes.isEmpty
                            ? 'Loading ...'
                            : strings.leave_type,
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    items: controller.allLeaveTypes.isEmpty
                        ? [
                            const DropdownMenuItem(
                              value: '',
                              child: Text('loading...'),
                            )
                          ]
                        : controller.allLeaveTypes
                            .map((element) => DropdownMenuItem(
                                value: element['id'].toString(),
                                child: Text(element['title'].toString())))
                            .toList(),
                    onChanged: (String? value) {
                      controller.selected_leave(value!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  validator: validateIsEmpty,
                  // value: controller.leave_type.value,
                  isDense: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      hintText: 'Type',
                      hintStyle: AppTextStyles.l1,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                  items: controller.leave_options
                      .map((element) => DropdownMenuItem(
                          value: element['id'].toString(),
                          child: Text(element['title'].toString())))
                      .toList(),
                  onChanged: (String? value) {
                    controller.leave_type(value!);
                  },
                ),
                Obx(() => controller.leave_type.value ==
                            controller.leave_options[0]['id'] ||
                        controller.leave_type.value.isEmpty
                    ? const SizedBox()
                    : const SizedBox(
                        height: 20,
                      )),
                Obx(
                  () => controller.leave_type.value ==
                              controller.leave_options[0]['id'] ||
                          controller.leave_type.value.isEmpty
                      ? const SizedBox()
                      : InkWell(
                          onTap: () async {
                            var now = DateTime.now();
                            var date = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (date != null) {
                              // print(date);
                              controller.start_time.text = date.format(context);
                              // controller.start_date.text = date.format(context).substring(0, 10);
                            }
                          },
                          child: TextFormField(
                            enabled: false,
                            controller: controller.start_time,
                            decoration: InputDecoration(
                                labelText: "Leave Start Time",
                                hintText: strings.duration,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                hintStyle: AppTextStyles.l1,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    var now = DateTime.now();
                    var date = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: now,
                        lastDate: now.add(365.days));
                    if (date != null) {
                      controller.start_date.text =
                          date.toIso8601String().substring(0, 10);
                    }
                  },
                  child: TextFormField(
                    enabled: false,
                    controller: controller.start_date,
                    decoration: InputDecoration(
                        labelText: "Leave Start Date",
                        hintText: strings.duration,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    var now = DateTime.now();
                    var date = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: now,
                        lastDate: now.add(365.days));
                    if (date != null) {
                      controller.end_date.text =
                          date.toIso8601String().substring(0, 10);
                    }
                  },
                  child: TextFormField(
                    enabled: false,
                    validator: validateIsEmpty,
                    controller: controller.end_date,
                    decoration: InputDecoration(
                        labelText: 'Leave End Date',
                        hintText: strings.duration,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    // var image = await ImagePicker().pickImage(
                    //     source: ImageSource.gallery, imageQuality: 50);
                    var image = (await FilePicker.platform.pickFiles(
                      allowCompression: true,
                      allowMultiple: false,
                      type: FileType.custom,
                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                    ));
                    if (image != null) {
                      controller.image(image.files.first.path);
                    }
                  },
                  child: Obx(
                    () => TextFormField(
                      enabled: false,
                      maxLines: 3,
                      controller:
                          TextEditingController(text: controller.image.value),
                      decoration: InputDecoration(
                          labelText: 'Documents',
                          isDense: true,
                          hintText: strings.upload_image,
                          hintStyle: AppTextStyles.l1,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.remarks,
                  validator: validateIsEmpty,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: strings.remarks,
                      hintStyle: AppTextStyles.l1,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    onPressed: () {
                      if (controller.end_date.text == '') {
                        if (!Get.isSnackbarOpen) {
                          Get.rawSnackbar(message: '* Complete All Fields');
                        }
                      } else if (formKey.currentState!.validate()) {
                        controller.onSubmit();
                      }
                      // Get.bottomSheet(
                      //     const Material(
                      //         color: Colors.white, child: ApplySuccess()),
                      //     isScrollControlled: true);
                    },
                    label: "Submit"),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplySuccess extends StatelessWidget {
  const ApplySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // const CloseButton(),
            //     // const SizedBox(
            //     //   width: 16,
            //     // ),
            //     Text(
            //       "Apply For Leave",
            //       style: Theme.of(context).textTheme.headline6,
            //       textAlign: TextAlign.center,
            //     ),
            //     // const Spacer()
            //   ],
            // ),
            // const SizedBox(
            //   height: 40,
            // ),
            const Text(
              """Successfully 
sent your request.""",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              """We’ve received your request. 
We will get back to you""",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                onPressed: () {
                  Get.back();
                },
                label: "Close"),
            const SizedBox(
              height: 20,
            ),
          ]),
    ));
  }
}
