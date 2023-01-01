import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/employer_dashboard/controllers/employer_dashboard_controller.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:intl/intl.dart';

import '../controllers/create_company_controller.dart';

class CreateCompanyView extends GetView<CreateCompanyController> {
  const CreateCompanyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('CreateCompanyView'),
        //   centerTitle: true,
        // ),
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create a company",
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                hintText: "Eg. Rasan Technologies [KTM]",
                hintStyle: AppTextStyles.l1,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Staff code",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                child: Radio(
                  toggleable: true,
                  groupValue: 'company_code',
                  value: "company_code",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          SizedBox(
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
                child: Radio(
                  groupValue: 'company_code',
                  value: "company",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          SizedBox(
            height: 20,
          ),
          Text(
            "Salary calculation day",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                child: Radio(
                  toggleable: true,
                  groupValue: 'company_code',
                  value: "company_code",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          SizedBox(
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
                child: Radio(
                  groupValue: 'company_code',
                  value: "company",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          SizedBox(
            height: 20,
          ),
          Text(
            "Business Leave Days",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                      Spacer(),
                      if (i == 0 || i == 6)
                        Checkbox(
                            activeColor: AppColors.primary,
                            value: true,
                            onChanged: (v) {})
                    ],
                  ))),
          SizedBox(
            height: 20,
          ),
          Text(
            "Add government leave days",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                  // contentPadding:
                  //     const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintText: "Please select",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Add special leave day",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                  // contentPadding:
                  //     const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintText: "Please select",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Office hours",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 191,
            height: 56,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(4)),
            child: Row(children: [
              Container(
                height: 56,
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
                height: 56,
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
          SizedBox(
            height: 20,
          ),
          Text(
            "Access network",
            style: AppTextStyles.l1.copyWith(color: AppColors.primary),
          ),
          SizedBox(
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
                child: Radio(
                  toggleable: true,
                  groupValue: 'company_code',
                  value: "company_code",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
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
          SizedBox(
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
                child: Radio(
                  groupValue: 'company_code',
                  value: "company",
                  activeColor: AppColors.primary,
                  onChanged: (Object? value) {},
                ),
              ),
              Container(
                height: 56,
                width: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Private office IP [ 192.168.1.10 ]",
                    style: AppTextStyles.l1,
                  ),
                ],
              )
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
              onPressed: () {
                EmployerDashboardController controller = Get.find();
                controller.addCompany();
                Get.back();
              },
              label: "Add"),
          SizedBox(
            height: 40,
          ),
        ],
      )),
    ));
  }
}
