import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/utils/validators.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              strings.employee,
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              strings.staff_code,
              style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.code,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: "RT001",
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.name,
              validator: validateIsEmpty,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: strings.full_name,
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.phone,
              validator: validatePhone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: strings.mobile_number,
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.address,
              keyboardType: TextInputType.number,
              validator: (v) => confirmPassword(
                  password: v!,
                  cPassword: controller.phone.text,
                  value: "Phone does not match."),
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: "Confirm Phone",
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.designation,
              validator: validateIsEmpty,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: strings.designation,
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              hint: 'Email', validator: validateEmail,
              controller: controller.email,
              // title: 'Email',
            ),
            // const Text("[Add from contact address]"),

            const SizedBox(
              height: 20,
            ),
            Text(
              strings.dob,
              style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(3000));
                if (date != null) {
                  controller.dob.value =
                      date.toIso8601String().substring(0, 10);
                }
              },
              child: Obx(
                () => TextFormField(
                  controller: TextEditingController(text: controller.dob.value),
                  enabled: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      hintText: "Please select",
                      hintStyle: AppTextStyles.l1,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(
            //   strings.office_hours,
            //   style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            // Container(
            //   width: 191,
            //   height: 46,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey.shade300),
            //       borderRadius: BorderRadius.circular(4)),
            //   child: Row(children: [
            //     Container(
            //       height: 46,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.remove,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //     Container(
            //       height: 46,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Expanded(
            //         child: Center(
            //             child: Text(
            //       "8:00",
            //       style: AppTextStyles.l1.copyWith(color: Colors.black),
            //     ))),
            //     Container(
            //       height: 56,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Container(
            //       height: 56,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.add,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //   ]),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            Text(
              "Office hours",
              style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                // width: 191,
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            controller.officeHourStart(
                                "${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}");
                          }
                        },
                        child: Obx(
                          () => TextFormField(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = controller.officeHourStart.value,
                            decoration:
                                const InputDecoration(hintText: 'Start time'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            controller.officeHourStart(
                                "${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}");
                          }
                        },
                        child: Obx(
                          () => TextFormField(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = controller.officeHourEnd.value,
                            decoration:
                                const InputDecoration(hintText: 'End time'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey.shade300),
                //     borderRadius: BorderRadius.circular(4)),
                // child: Row(children: [
                //   Container(
                //     height: 56,
                //     width: 56,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(.1),
                //     ),
                //     child: Icon(
                //       Icons.remove,
                //       color: AppColors.primary,
                //     ),
                //   ),
                //   Container(
                //     height: 56,
                //     width: 1,
                //     color: Colors.grey.shade300,
                //   ),
                //   Expanded(
                //       child: Center(
                //           child: Text(
                //     "8:00",
                //     style: AppTextStyles.l1.copyWith(color: Colors.black),
                //   ))),
                //   Container(
                //     height: 56,
                //     width: 1,
                //     color: Colors.grey.shade300,
                //   ),
                //   Container(
                //     height: 56,
                //     width: 56,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(.1),
                //     ),
                //     child: Icon(
                //       Icons.add,
                //       color: AppColors.primary,
                //     ),
                //   ),
                // ]),
                ),
            const SizedBox(
              height: 20,
            ),
            // Container(
            //   width: 191,
            //   height: 46,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey.shade300),
            //       borderRadius: BorderRadius.circular(4)),
            //   child: Row(children: [
            //     Container(
            //       height: 46,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.remove,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //     Container(
            //       height: 46,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Expanded(
            //         child: Center(
            //             child: Text(
            //       "8:00",
            //       style: AppTextStyles.l1.copyWith(color: Colors.black),
            //     ))),
            //     Container(
            //       height: 56,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Container(
            //       height: 56,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.add,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //   ]),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            Text(
              "Break hours",
              style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(
              height: 15,
            ),
            // Text(
            //   "Office hours",
            //   style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            SizedBox(
                // width: 191,
                height: 56,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            controller.breakStart(
                                "${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}");
                          }
                        },
                        child: Obx(
                          () => TextFormField(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = controller.breakStart.value,
                            decoration:
                                const InputDecoration(hintText: 'Break start'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (time != null) {
                            controller.breakEnd(
                                "${time.hour < 10 ? '0${time.hour}' : time.hour}:${time.minute < 10 ? '0${time.minute}' : time.minute}");
                          }
                        },
                        child: Obx(
                          () => TextFormField(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = controller.breakEnd.value,
                            decoration:
                                const InputDecoration(hintText: 'Break end'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // decoration: BoxDecoration(
                //     border: Border.all(color: Colors.grey.shade300),
                //     borderRadius: BorderRadius.circular(4)),
                // child: Row(children: [
                //   Container(
                //     height: 56,
                //     width: 56,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(.1),
                //     ),
                //     child: Icon(
                //       Icons.remove,
                //       color: AppColors.primary,
                //     ),
                //   ),
                //   Container(
                //     height: 56,
                //     width: 1,
                //     color: Colors.grey.shade300,
                //   ),
                //   Expanded(
                //       child: Center(
                //           child: Text(
                //     "8:00",
                //     style: AppTextStyles.l1.copyWith(color: Colors.black),
                //   ))),
                //   Container(
                //     height: 56,
                //     width: 1,
                //     color: Colors.grey.shade300,
                //   ),
                //   Container(
                //     height: 56,
                //     width: 56,
                //     decoration: BoxDecoration(
                //       color: Colors.grey.withOpacity(.1),
                //     ),
                //     child: Icon(
                //       Icons.add,
                //       color: AppColors.primary,
                //     ),
                //   ),
                // ]),
                ),

            // Container(
            //   width: 191,
            //   height: 46,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey.shade300),
            //       borderRadius: BorderRadius.circular(4)),
            //   child: Row(children: [
            //     Container(
            //       height: 46,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.remove,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //     Container(
            //       height: 46,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Expanded(
            //         child: Center(
            //             child: Text(
            //       "8:00",
            //       style: AppTextStyles.l1.copyWith(color: Colors.black),
            //     ))),
            //     Container(
            //       height: 56,
            //       width: 1,
            //       color: Colors.grey.shade300,
            //     ),
            //     Container(
            //       height: 56,
            //       width: 56,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.withOpacity(.1),
            //       ),
            //       child: Icon(
            //         Icons.add,
            //         color: AppColors.primary,
            //       ),
            //     ),
            //   ]),
            // ),

            const SizedBox(
              height: 20,
            ),
            CustomDropDownField(
              value: controller.salaryType.text,
              onChanged: (String? v) {
                controller.salaryType.text = v!;
              },
              title: "Salary Type",
              hint: "eg.2500",
              items: const ['monthly', 'Part Time'],
            ),
            CustomFormField(
                num: true,
                controller: controller.salaryAmount,
                validator: validateIsEmpty,
                title: "Salary Amount",
                hint: "eg.2500"),
            Text(
              "Joining Date",
              style: AppTextStyles.l1.copyWith(color: AppColors.primary),
            ),
            const SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(3000));
                if (date != null) {
                  controller.joiningDate.value =
                      date.toIso8601String().substring(0, 10);
                }
              },
              child: Obx(
                () => TextFormField(
                  // initialValue: controller.joiningDate.value,
                  controller: TextEditingController()
                    ..text = controller.joiningDate.value,
                  // validator: validateIsEmpty,
                  enabled: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      hintText: "Please select",
                      hintStyle: AppTextStyles.l1,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Duty Time"),
                const Spacer(),
                Container(
                  width: 191,
                  height: 46,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.dutyTime,
                        validator: validateIsEmpty,
                        decoration: const InputDecoration(
                            hintText: 'Duty hours',
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    // Container(
                    //   height: 56,
                    //   width: 56,
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.withOpacity(.1),
                    //   ),
                    //   child: const Text("AM"),
                    // ),
                  ]),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text("Overtime [Ratio]"),
                const Spacer(),
                Obx(
                  () => Checkbox(
                      value: controller.hasOvertimerRatio.value,
                      onChanged: (bool? v) {
                        controller.hasOvertimerRatio(v!);
                      }),
                ),
                Obx(
                  () => !controller.hasOvertimerRatio.value
                      ? const SizedBox()
                      : Container(
                          width: 191,
                          height: 46,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(4)),
                          child: TextFormField(
                            controller: controller.overTime,
                            decoration: const InputDecoration(
                                hintText: "eg.1,1.5,2",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                border: InputBorder.none),
                          )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.loading.isFalse) {
                      controller.addCadidate();
                    }
                  }
                  // Get.back(result: true);
                },
                label: "Add"),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    ));
  }
}

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField(
      {super.key,
      required this.title,
      this.value,
      required this.hint,
      this.onChanged,
      required this.items});
  final String title;
  final List<String> items;
  final String hint;
  final String? value;
  final onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            value: value,
            items: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.capitalize ?? "NA"),
                    ))
                .toList(),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                hintText: hint,
                hintStyle:
                    AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      this.title = "",
      required this.hint,
      this.validator,
      this.isMultiline = false,
      this.num = false,
      this.controller});
  final String title;
  final String hint;
  final bool isMultiline;
  final controller;
  final validator;
  final bool num;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: title == ""
          ? TextFormField(
              validator: validator,
              controller: controller,
              maxLines: isMultiline ? 5 : 1,
              keyboardType: num ? TextInputType.number : TextInputType.text,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  hintText: hint,
                  hintStyle:
                      AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: AppTextStyles.l1.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: num ? TextInputType.number : TextInputType.text,
                validator: validator,
                controller: controller,
                maxLines: isMultiline ? 5 : 1,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    hintText: hint,
                    hintStyle:
                        AppTextStyles.l1.copyWith(fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ]),
    );
  }
}
