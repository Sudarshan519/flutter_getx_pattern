import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/missing_attendance_controller.dart';

class MissingAttendanceView extends GetView<MissingAttendanceController> {
  const MissingAttendanceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.missing_attendance,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                  // style: Theme.of(context)
                  //     .textTheme
                  //     .headline6!
                  //     .copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormField(
                  hint: strings.name_or_number,
                ),
                CustomFormField(
                  hint: strings.check_in_date,
                ),
                CustomFormField(
                  hint: strings.check_in_time,
                ),
                CustomFormField(
                  hint: strings.check_out_time,
                ),
                Row(
                  children: [
                    Text(
                      strings.overtime,
                      style: AppTextStyles.b2,
                    ),
                    Spacer(),
                    Container(
                      height: 56,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      bottomLeft: Radius.circular(4))),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 56,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "01:00",
                              style: AppTextStyles.b2,
                            ),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4)),
                            onTap: () {},
                            child: Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      bottomRight: Radius.circular(4))),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    label: strings.add),
              ],
            )));
  }
}
