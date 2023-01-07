import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/custom_paint/circular_progress_paint.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class OverAllReports extends StatelessWidget {
  const OverAllReports({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: AppBottomSheet(
        child: Column(children: [
          TitleWidget(title: "Overall reports"),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ReportsButton(
                        onPressed: () {
                          controller.selectedReport(5);
                        },
                        active:
                            controller.selectedReport.value == 5 ? true : false,
                        label: strings.daily),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReportsButton(
                        onPressed: () {
                          controller.selectedReport(0);
                        },
                        active:
                            controller.selectedReport.value == 0 ? true : false,
                        label: strings.weekly),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReportsButton(
                        active:
                            controller.selectedReport.value == 1 ? true : false,
                        onPressed: () {
                          controller.selectedReport(1);
                        },
                        label: strings.monthly),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReportsButton(
                        active:
                            controller.selectedReport.value == 2 ? true : false,
                        onPressed: () {
                          controller.selectedReport(2);
                        },
                        label: strings.annual),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ReportItem(
            title: strings.attendee,
            value: "20",
            color: Color.fromRGBO(0, 128, 0, .1),
          ),
          ReportItem(
            title: strings.absent,
            value: "20",
            color: Color.fromRGBO(255, 80, 80, 0.1),
          ),
          ReportItem(
            title: strings.late,
            value: "20",
            color: Color.fromRGBO(128, 128, 128, 0.1),
          ),
          ReportItem(
            title: strings.early_punch_out,
            value: "20",
            color: Color.fromRGBO(0, 0, 255, 0.1),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 80,
            width: 80,
            child: CustomPaint(
              painter: CircularPercentPaint(
                allGreen: true,
                progress: 97.toInt(),
              ),
              child: Center(
                  child: Text(
                "97%",
                style: AppTextStyles.b1.copyWith(color: Colors.green.shade800),
              )),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            strings.attendance_records,
            style: AppTextStyles.title,
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: SvgPicture.asset("assets/Vector(2).svg")),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Send Invitation"),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Export"),
              ),
            )
          ]),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  const ReportItem({
    required this.color,
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        height: 40.h,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Text(
              value,
              style: AppTextStyles.b1.copyWith(color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: VerticalDivider(),
            ),
            Text(
              title,
              style: AppTextStyles.b2,
            )
          ],
        ));
  }
}
