import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/individual_reports.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/overall_reports.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

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
          Text(
            "Rasan Technologies",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AttendanceItem(
                  label: strings.attendee,
                  value: "20",
                  color: Color.fromRGBO(0, 128, 0, .1),
                  borderColor: Color.fromRGBO(0, 128, 0, .05)),
              AttendanceItem(
                  label: strings.absent,
                  value: "20",
                  color: Color.fromRGBO(255, 80, 80, 0.1),
                  borderColor: Color.fromRGBO(255, 80, 80, 0.05)),
              AttendanceItem(
                label: strings.late,
                value: "20",
                color: Color.fromRGBO(128, 128, 128, 0.1),
                borderColor: Color.fromRGBO(128, 128, 128, 0.05),
              ),
              AttendanceItem(
                onPressed: () {
                  Get.bottomSheet(
                    OverAllReports(),
                    isScrollControlled: true,
                  );
                },
                label: strings.reports,
                value: "20",
                color: Color.fromRGBO(0, 0, 255, 0.1),
                borderColor: Color.fromRGBO(0, 0, 255, 0.1),
              )
            ],
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
            child: ListView.builder(
                itemCount: employeeList.length,
                itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            IndividualReport(),
                            isScrollControlled: true,
                          );
                        },
                        child: Container(
                          height: 66.h,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(employeeList[i].name!),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "RT00${i}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 56.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.green.shade800),
                                  onPressed: () {},
                                  child: Text(
                                    strings.present
                                        .split(" ")
                                        .first
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 54.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.red),
                                  onPressed: () {},
                                  child: Text(
                                    strings.present
                                        .split(" ")
                                        .last
                                        .toUpperCase(),
                                    style: TextStyle(fontSize: 7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              SizedBox(
                                height: 16.h,
                                width: 50.w,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.grey.shade400),
                                  onPressed: () {},
                                  child: Text(
                                    strings.leave,
                                    style: TextStyle(fontSize: 7.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
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
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: color),
              color: borderColor),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              style: AppTextStyles.title.copyWith(
                fontSize: 12.sp,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
