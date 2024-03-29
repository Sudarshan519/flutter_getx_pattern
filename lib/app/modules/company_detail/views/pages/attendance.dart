import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/individual_reports.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/overall_reports.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import 'package:intl/intl.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.attendance,
            style:
                Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                controller.company.value.name ?? "NA",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              Text(
                DateFormat('dd, MMM yyyy').format(DateTime.now()).toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AttendanceItem(
                    label: strings.attendee,
                    value:
                        controller.employerReport['total_attendee'].toString(),
                    color: const Color.fromRGBO(0, 128, 0, .1),
                    borderColor: const Color.fromRGBO(0, 128, 0, .05)),
                AttendanceItem(
                    label: strings.absent,
                    value: controller.employerReport['absent'].toString(),
                    color: const Color.fromRGBO(255, 80, 80, 0.1),
                    borderColor: const Color.fromRGBO(255, 80, 80, 0.05)),
                AttendanceItem(
                  label: strings.late,
                  value: controller.employerReport['late'].toString(),
                  color: const Color.fromRGBO(128, 128, 128, 0.1),
                  borderColor: const Color.fromRGBO(128, 128, 128, 0.05),
                ),
                AttendanceItem(
                  onPressed: () {
                    Get.bottomSheet(
                      const OverAllReports(),
                      isScrollControlled: true,
                    );
                  },
                  label: strings.reports,
                  value: "",
                  color: const Color.fromRGBO(0, 0, 255, 0.1),
                  borderColor: const Color.fromRGBO(0, 0, 255, 0.1),
                )
              ],
            ),
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
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(236, 237, 240, 1), blurRadius: 2)
                ],
                color: const Color.fromRGBO(236, 237, 240, 1)),
            child: Obx(
              () => Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selected = 0;
                        controller.getEmployerReport();
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
                            strings.all,
                            style: AppTextStyles.b2,
                          )),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selected = 1;
                        controller.getActiveCandidates();
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
                            strings.active,
                            style: AppTextStyles.b2,
                          )),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selected = 2;
                        controller.getInactiveCandidates();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: controller.selected == 2
                                  ? Colors.white
                                  : Colors.transparent),
                          height: 32.h,
                          width: double.infinity,
                          child: Text(
                            strings.inactive,
                            style: AppTextStyles.b2,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Obx(
              () => controller.attendanceLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.employerReport['candidates'] != null
                          ? controller.employerReport['candidates'].length
                          : 0,
                      itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {
                                Get.bottomSheet(
                                  const IndividualReport(),
                                  settings: RouteSettings(
                                      arguments: controller
                                          .employerReport['candidates'][i]),
                                  isScrollControlled: true,
                                );
                              },
                              child: Container(
                                height: 80.r,
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(controller.employerReport[
                                                  'candidates'][i]['name'] ??
                                              "NA"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            controller.employerReport[
                                                    'candidates'][i]['code'] ??
                                                "NA",
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20.r,
                                      width: 64.r,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: controller
                                                                    .employerReport[
                                                                'candidates'][i]
                                                            ['status'] ==
                                                        "Active" ||
                                                    controller.employerReport[
                                                                'candidates'][i]
                                                            ['status'] ==
                                                        'Present'
                                                ? Colors.green.shade800
                                                : controller.employerReport[
                                                                'candidates'][i]
                                                            ['status'] ==
                                                        'late'
                                                    ? Colors.grey
                                                    : Colors.red),
                                        onPressed: () {},
                                        child: Text(
                                          controller.employerReport[
                                                  'candidates'][i]['status'] ??
                                              "NA",
                                          style: const TextStyle(fontSize: 7),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
            ),
          )
        ],
      ),
    );
  }
}

class AttendanceItem extends StatelessWidget {
  const AttendanceItem(
      {Key? key,
      required this.label,
      required this.value,
      required this.borderColor,
      this.onPressed,
      required this.color})
      : super(key: key);
  final String label;
  final String value;
  final Color color;
  final Color borderColor;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 78.r,
            width: 78.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: color),
                color: borderColor),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              label == "Reports"
                  ? SvgPicture.asset(
                      "assets/material-symbols_export-notes-outline-rounded.svg")
                  : Text(
                      value,
                      style: AppTextStyles.b1
                          .copyWith(fontSize: 19.sp, color: Colors.red),
                    ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.title.copyWith(
                  fontSize: 12.sp,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
