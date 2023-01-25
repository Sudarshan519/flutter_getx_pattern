import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          const Text("[Add from contact address]"),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                hintText: "Email Address",
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
          Text(
            strings.dob,
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {},
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColors.primary,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
            height: 20,
          ),
          Text(
            strings.office_hours,
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 191,
            height: 46,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4)),
            child: Row(children: [
              Container(
                height: 46,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.primary,
                ),
              ),
              Container(
                height: 46,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                  child: Center(
                      child: Text(
                "8:00",
                style: AppTextStyles.l1.copyWith(color: Colors.black),
              ))),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 191,
            height: 46,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4)),
            child: Row(children: [
              Container(
                height: 46,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.primary,
                ),
              ),
              Container(
                height: 46,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                  child: Center(
                      child: Text(
                "8:00",
                style: AppTextStyles.l1.copyWith(color: Colors.black),
              ))),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Break hours",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 191,
            height: 46,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4)),
            child: Row(children: [
              Container(
                height: 46,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.primary,
                ),
              ),
              Container(
                height: 46,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Expanded(
                  child: Center(
                      child: Text(
                "8:00",
                style: AppTextStyles.l1.copyWith(color: Colors.black),
              ))),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.primary,
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomDropDownField(
            title: "Salary Type",
            hint: "eg.2500",
            items: ['Full Time', 'Part Time'],
          ),
          const CustomFormField(title: "Salary Amount", hint: "eg.2500"),
          Text(
            "Joining Date",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {},
            child: TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: AppColors.primary,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    height: 46,
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                    ),
                    child: const Text("AM"),
                  ),
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
              Checkbox(value: false, onChanged: (v) {}),
              Container(
                  width: 191,
                  height: 46,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "eg.1,1.5,2",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none),
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              onPressed: () {
                Get.back(result: true);
              },
              label: "Add"),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    ));
  }
}

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField(
      {super.key,
      required this.title,
      required this.hint,
      required this.items});
  final String title;
  final List<String> items;
  final String hint;
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
            items: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
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
            onChanged: (value) {},
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
      this.isMultiline = false});
  final String title;
  final String hint;
  final bool isMultiline;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: title == ""
          ? TextFormField(
              maxLines: isMultiline ? 5 : 1,
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
