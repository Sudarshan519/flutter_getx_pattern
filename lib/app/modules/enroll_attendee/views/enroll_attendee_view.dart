import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/views/pages/attendance.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/enroll_attendee_controller.dart';

class EnrollAttendeeView extends GetView<EnrollAttendeeController> {
  const EnrollAttendeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // BackButton(),
            Text(
              strings.enroll_attendee,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 36.h,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  color: Colors.grey.shade100
                  // boxShadow: const [
                  //   BoxShadow(
                  //       color: Color.fromRGBO(236, 237, 240, 1), blurRadius: 2)
                  // ],
                  // color: const Color.fromRGBO(236, 237, 240, 1)),
                  ),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selected = 0;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: controller.selected == 0
                                    ? Colors.white
                                    : Colors.transparent),
                            height: 32.h,
                            width: double.infinity,
                            child: Text(
                              strings.clock_in,
                              style: AppTextStyles.b2,
                            )),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.selected = 1;
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: controller.selected == 1
                                    ? Colors.white
                                    : Colors.transparent),
                            height: 32.h,
                            width: double.infinity,
                            child: Text(
                              strings.clock_out,
                              style: AppTextStyles.b2,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AttendanceItem(
                    label: strings.attendee,
                    value: "20",
                    color: const Color.fromRGBO(0, 128, 0, .1),
                    borderColor: const Color.fromRGBO(0, 128, 0, .05)),
                AttendanceItem(
                    label: strings.absent,
                    value: "20",
                    color: const Color.fromRGBO(255, 80, 80, 0.1),
                    borderColor: const Color.fromRGBO(255, 80, 80, 0.05)),
                AttendanceItem(
                  label: strings.late,
                  value: "20",
                  color: const Color.fromRGBO(128, 128, 128, 0.1),
                  borderColor: const Color.fromRGBO(128, 128, 128, 0.05),
                ),
                AttendanceItem(
                  // onPressed: () {
                  //   Get.bottomSheet(
                  //     OverAllReports(),
                  //     isScrollControlled: true,
                  //   );
                  // },
                  label: strings.pending,
                  value: "20",
                  color: const Color.fromRGBO(0, 0, 255, 0.1),
                  borderColor: const Color.fromRGBO(0, 0, 255, 0.1),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
                child: ListView.builder(
                    itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                            height: 66,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nitesh Shrestha",
                                        style: AppTextStyles.b1,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "${strings.clock_in} - 9:30:31 AM",
                                        style: AppTextStyles.body,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Colors.grey.shade300)),
                                    height: 22,
                                    child: Text(
                                      "9:00 AM",
                                      style: AppTextStyles.b2,
                                    )),
                                const SizedBox(
                                  width: 18,
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(6),
                                  onTap: () {},
                                  child: Container(alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.green.shade800,
                                        border: Border.all(color: Colors.green)),
                                    height: 22,
                                    child: Text(
                                     strings.accept,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                              ],
                            ),
                          ),
                        )))
          ]),
        ),
      ),
    );
  }
}
