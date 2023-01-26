import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/employer_dashboard/controllers/employer_dashboard_controller.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class AddApprover extends StatelessWidget {
  const AddApprover({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployerDashboardController controller = Get.find();
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: AppBottomSheet(
            child: Column(
          children: [
            TitleWidget(title: strings.add_approver),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomFormField(
                    hint: strings.select_approver,
                    title: strings.add_approver,
                  ),
                  CustomDropDownField(
                      title: strings.select_company,
                      hint: strings.select_company,
                      items: controller.companyList
                          .map((e) => e.name ?? "")
                          .toList()),
                  CustomButton(onPressed: () {}, label: strings.add),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
