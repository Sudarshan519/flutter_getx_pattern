import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/custom_paint/circular_progress_paint.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';

import '../../../../../../core/localization/l10n/strings.dart';

class AddApprover extends StatelessWidget {
  const AddApprover({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: AppBottomSheet(
            child: Column(
          children: [
            TitleWidget(title: strings.add_approver),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomFormField(
                    hint: "Select Approver",
                    title: strings.add_approver,
                  ),
                  CustomDropDownField(
                    title: "Select Company",
                    hint: "",
                    items: ['A', 'B'],
                  ),
                  CustomButton(onPressed: () {}, label: "Add"),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
