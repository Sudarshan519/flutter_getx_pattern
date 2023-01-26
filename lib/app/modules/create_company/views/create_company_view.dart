import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/utils/validators.dart';
import 'package:intl/intl.dart';

import '../controllers/create_company_controller.dart';

class CreateCompanyView extends GetView<CreateCompanyController> {
  const CreateCompanyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create a company",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.name,
                validator: validateIsEmpty,
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    hintText: "Eg. Rasan Technologies [KTM]",
                    hintStyle: AppTextStyles.l1,
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
                hint: '',
                title: "Email",
                validator: validateEmail,
                controller: controller.email,
              ),
              CustomFormField(
                hint: '',
                title: "Phone",
                validator: validatePhone,
                controller: controller.phone,
              ),
              CustomFormField(
                hint: '',
                title: "Address",
                validator: validateIsEmpty,
                controller: controller.address,
              ),
              Text(
                "Staff code",
                style: AppTextStyles.l1.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Container(
                    width: 46,
                    height: 56,
                    color: Colors.grey.shade200,
                    child: Obx(() => Radio(
                          toggleable: true,
                          groupValue: controller.codeType.value,
                          value: "auto",
                          activeColor: AppColors.primary,
                          onChanged: (String? value) {
                            controller.codeType(value!);
                          },
                        )),
                  ),
                  Container(
                    height: 56,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Auto generated",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Eg, R001,R002",
                        style: TextStyle(fontSize: 7, color: Colors.grey),
                      )
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Obx(
                  () => Row(children: [
                    Container(
                      width: 46,
                      height: 56,
                      color: Colors.grey.shade200,
                      child: Obx(
                        () => Radio(
                          groupValue: controller.codeType.value,
                          value: "custom",
                          activeColor: AppColors.primary,
                          onChanged: (String? value) {
                            controller.codeType(value);
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    controller.codeType.value == 'custom'
                        ? Expanded(
                            child: TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Custom",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Eg, R001,R002",
                                style:
                                    TextStyle(fontSize: 7, color: Colors.grey),
                              )
                            ],
                          )
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Salary calculation day",
                style: AppTextStyles.l1.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Container(
                    width: 46,
                    height: 56,
                    color: Colors.grey.shade200,
                    child: Obx(
                      () => Radio(
                        toggleable: true,
                        groupValue: controller.calculation_type.value,
                        value: "calendar_days",
                        activeColor: AppColors.primary,
                        onChanged: (String? value) {
                          controller.calculation_type(value!);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Calendar Days",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Eg, Feb 28, Mar 31",
                        style: TextStyle(fontSize: 7, color: Colors.grey),
                      )
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Container(
                    width: 46,
                    height: 56,
                    color: Colors.grey.shade200,
                    child: Obx(
                      () => Radio(
                        groupValue: controller.calculation_type.value,
                        value: "30 days",
                        activeColor: AppColors.primary,
                        onChanged: (String? value) {
                          controller.calculation_type(value!);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "30 days",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Eg, Feb 30,Mar 30",
                        style: TextStyle(fontSize: 7, color: Colors.grey),
                      )
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Business Leave Days",
                style: AppTextStyles.l1.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 15,
              ),
              ...List.generate(
                  7,
                  (i) => Container(
                      height: 44,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                              DateFormat("EEEE").format(DateTime.now().subtract(
                                  Duration(days: DateTime.now().weekday - i))),
                              style: AppTextStyles.normal),
                          const Spacer(),
                          // if (i == 0 || i == 6)
                          // if (controller.companyWorkingDays.contains(
                          //     DateFormat("EEEE").format(DateTime.now()
                          //         .subtract(Duration(
                          //             days: DateTime.now().weekday - i)))))
                          Obx(
                            () => Checkbox(
                                activeColor: AppColors.primary,
                                value: controller.companyWorkingDays.contains(
                                        DateFormat("EEEE").format(DateTime.now()
                                            .subtract(Duration(
                                                days: DateTime.now().weekday -
                                                    i))))
                                    ? true
                                    : false,
                                onChanged: (bool? v) {
                                  if (v == true) {
                                    controller.companyWorkingDays.add(
                                        DateFormat("EEEE").format(DateTime.now()
                                            .subtract(Duration(
                                                days: DateTime.now().weekday -
                                                    i))));
                                  } else {
                                    controller.companyWorkingDays.remove(
                                        DateFormat("EEEE").format(DateTime.now()
                                            .subtract(Duration(
                                                days: DateTime.now().weekday -
                                                    i))));
                                  }
                                }),
                          )
                        ],
                      ))),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add government leave days",
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
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (date != null) {
                    if (!controller.governmentLeaveDates
                        .contains(date.toIso8601String())) {
                      controller.governmentLeaveDates
                          .add(date.toIso8601String().substring(0, 10));
                    }
                  }
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                      // contentPadding:
                      //     const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Column(
                  children: controller.governmentLeaveDates
                      .map((element) => ListTile(
                            title: Text(element.toString()),
                            trailing: IconButton(
                                onPressed: () => controller.governmentLeaveDates
                                    .remove(element),
                                icon: const Icon(Icons.close)),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Add special leave day",
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
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (date != null) {
                    if (!controller.specialLeaveDates
                        .contains(date.toIso8601String())) {
                      controller.specialLeaveDates
                          .add(date.toIso8601String().substring(0, 10));
                    }
                  }
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primary,
                      ),
                      // contentPadding:
                      //     const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
              const SizedBox(
                height: 12,
              ),
              Obx(
                () => Column(
                  children: controller.specialLeaveDates
                      .map((element) => ListTile(
                            title: Text(element.toString()),
                            trailing: IconButton(
                                onPressed: () => controller.specialLeaveDates
                                    .remove(element),
                                icon: const Icon(Icons.close)),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
              Text(
                "Access network",
                style: AppTextStyles.l1.copyWith(color: AppColors.primary),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(children: [
                  Container(
                    width: 46,
                    height: 56,
                    color: Colors.grey.shade200,
                    child: Obx(
                      () => Radio(
                        groupValue: controller.networkType.value,
                        value: "any",
                        activeColor: AppColors.primary,
                        onChanged: (String? value) {
                          controller.networkType(value);
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 56,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Any network",
                        style: AppTextStyles.l1,
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 46,
                        height: 56,
                        color: Colors.grey.shade200,
                        child: Obx(
                          () => Radio(
                            groupValue: controller.networkType.value,
                            value: 'private',
                            activeColor: AppColors.primary,
                            onChanged: (String? value) {
                              controller.networkType(value);
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 56,
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   "Private office IP [ 192.168.1.10 ]",
                            //   style: AppTextStyles.l1,
                            // ),
                            Expanded(
                                child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: AppTextStyles.l1,
                                  hintText:
                                      "Private office IP [ 192.168.1.10 ]"),
                            )),
                          ],
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (controller.loading.isFalse) {
                        controller.addCompany();
                      }
                    }
                    // EmployerDashboardController controller = Get.find();
                    // controller.getCompanies();
                    // Get.back();
                  },
                  label: "Add"),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
