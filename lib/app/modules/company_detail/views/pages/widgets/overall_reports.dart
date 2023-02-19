import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/custom_paint/circular_progress_paint.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class OverallController extends GetxController {
  var loading = false.obs;
  var dailyReport = {}.obs;
  final CompanyDetailController controller = Get.find();
  final AttendanceSystemProvider attendanceApi = Get.find();
  @override
  onInit() {
    super.onInit();
    getDailyReports();
  }

  void getDailyReports() async {
    loading(true);
    try {
      var result = await attendanceApi.getOverAllDailyReport(
          companyId: controller.selectedCompany.value,
          type: controller.selectedReport.value);
      dailyReport(result.body['data']);
    } catch (e) {
      Get.rawSnackbar(message: e.toString());
    }
    loading(false);
  }
}

class OverAllReports extends StatelessWidget {
  const OverAllReports({super.key});

  @override
  Widget build(BuildContext context) {
    final OverallController overallController = Get.find();
    final CompanyDetailController controller = Get.find();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: AppBottomSheet(
        child: Obx(
          () => SizedBox(
            height: Get.height * .8,
            child: Column(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWidget(title: strings.overall_reports),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ReportsButton(
                              onPressed: () {
                                controller.selectedReport(5);
                                overallController.getDailyReports();
                              },
                              active: controller.selectedReport.value == 5
                                  ? true
                                  : false,
                              label: strings.daily),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReportsButton(
                              onPressed: () {
                                controller.selectedReport(0);
                                overallController.getDailyReports();
                              },
                              active: controller.selectedReport.value == 0
                                  ? true
                                  : false,
                              label: strings.weekly),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReportsButton(
                              active: controller.selectedReport.value == 1
                                  ? true
                                  : false,
                              onPressed: () {
                                controller.selectedReport(1);
                                overallController.getDailyReports();
                              },
                              label: strings.monthly),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReportsButton(
                              active: controller.selectedReport.value == 2
                                  ? true
                                  : false,
                              onPressed: () {
                                controller.selectedReport(2);
                                overallController.getDailyReports();
                              },
                              label: strings.annual),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              overallController.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        ReportItem(
                          title: strings.attendee,
                          value: overallController.dailyReport['total_attendee']
                              .toString(),
                          color: const Color.fromRGBO(0, 128, 0, .1),
                        ),
                        ReportItem(
                          title: strings.absent,
                          value: overallController.dailyReport['absent']
                              .toString(),
                          color: const Color.fromRGBO(255, 80, 80, 0.1),
                        ),
                        ReportItem(
                          title: strings.late,
                          value:
                              overallController.dailyReport['late'].toString(),
                          color: const Color.fromRGBO(128, 128, 128, 0.1),
                        ),
                        ReportItem(
                          title: strings.early_punch_out,
                          value: overallController.dailyReport['punch_out']
                              .toString(),
                          color: const Color.fromRGBO(0, 0, 255, 0.1),
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
                              progress:
                                  overallController.dailyReport['percentage'] ??
                                      0,
                            ),
                            child: Center(
                                child: Text(
                              '${overallController.dailyReport['percentage'] ?? '0'}%',
                              style: AppTextStyles.b1
                                  .copyWith(color: Colors.green.shade800),
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          strings.attendance_records,
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       InkWell(
              //         onTap: () {},
              //         child: Row(
              //           children: [
              //             CircleAvatar(
              //                 backgroundColor: Colors.grey.shade200,
              //                 child: SvgPicture.asset(
              //                     "assets/Vector(2).svg")),
              //             const SizedBox(
              //               width: 8,
              //             ),
              //             Text(strings.send_invitation),
              //           ],
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {},
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(strings.export),
              //         ),
              //       )
              //     ]),
              // const SizedBox(
              //   height: 20,
              // )
            ]),
          ),
        ),
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
            const Padding(
              padding: EdgeInsets.all(8.0),
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
