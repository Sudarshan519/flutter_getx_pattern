import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/data/providers/attendance_provider.dart';
import 'package:hajir/app/data/providers/network/api_endpoint.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/app/modules/dashboard/views/apply_leave.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import 'package:intl/intl.dart';

var weekDay = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
var now = DateTime.now();

class ResultProvider extends GetConnect {
  @override
  onInit() {
    super.onInit();
    httpClient.baseUrl = APIEndpoint.baseUrl;
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
  }

  Future<BaseResponse> getMonthlyReport() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    return parseRes(await get(
        "${APIEndpoint.monthlyReport}/${appSettings.companyId}",
        headers: globalHeaders));
  }

  Future<BaseResponse> getWeeklyReport() async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    return parseRes(await get(
        "${APIEndpoint.weeklyReport}/${appSettings.companyId}",
        headers: globalHeaders));
  }

  Future<BaseResponse> getYearlyReport(String year) async {
    globalHeaders['Authorization'] = 'Bearer ${appSettings.token}';
    return parseRes(await get(
        "${APIEndpoint.yearlyReport}/${appSettings.companyId}/$year",
        headers: globalHeaders));
  }
}

class ReportController extends GetxController {
  final ResultProvider repository = Get.find();
  var monthly = {}.obs;
  var weekly = {}.obs;
  var yearly = {}.obs;
  var loadingSuccess = false.obs;
  var loading = false.obs;
  var selectedMonth = 0.obs;
  var selectedReportType = 0.obs;
  var selectedYear = 0.obs;
  var now = DateTime.now();

  int yearlyTotal() {
    int sum = 0;
    yearly['data'].forEach((e) {
      sum = sum + int.parse(e['total_earning'] ?? 0);
    });
    return sum;
  }

  // yearly['data']
  //     .fold(0, (int t, e) => (int.tryParse(e['total_earning']) ?? 0 + t)) ??
  // 0;
  selectMonth(int i) {
    selectedMonth(i);
  }

  int get selectedReport => selectedReportType.value;
  set selectedReport(int i) => selectedReportType(i);

  @override
  onInit() {
    super.onInit();
    selectedYear(now.year);
    getWeeklyReport();
    getMonthlyReport();
    getYearlyReport();
  }

  getWeeklyReport() async {
    try {
      loading(true);
      var result = await repository.getWeeklyReport();
      loading(false);
      log(result.body);
      weekly(result.body['data']);
      loadingSuccess(true);
    } catch (e) {
      loading(false);
      Get.rawSnackbar(message: e.toString());
    }
  }

  getMonthlyReport() async {
    try {
      var result = await repository.getMonthlyReport();
      loadingSuccess(true);
      monthly(result.body['data']);
      log(result.body);
    } catch (e) {}
  }

  getYearlyReport() async {
    try {
      // var year = DateTime.now().year.toString();
      var result = await repository.getYearlyReport(selectedYear.toString());
      loadingSuccess(true);
      yearly(result.body['data']);
      print(result.body);
    } catch (e) {}
  }

  void changeSelectedYear(int i) {
    selectedYear((now.year) - i);
    getYearlyReport();
  }
}

class Reports extends GetView<ReportController> {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashBoardController = Get.find();
    // controller.getYearlyReport();
    // print(controller.weekly['weekdata ']);
    // print(controller.yearly);
    // print(controller.monthly);
    // print(controller.yearlyTotal());
    // print(controller.weekly.containsKey('weekdata'));
    // print(controller.weekly.keys.map((e) => print(e)));
    return AppBottomSheet(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleWidget(title: strings.reports),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dashBoardController.user.value.name.toString(),
                            style: AppTextStyles.normal,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "RT001",
                            style: AppTextStyles.normal.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                              .1,
                            ),
                            shape: BoxShape.circle),
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          "assets/Vector(2).svg",
                          color: Colors.grey,
                          width: 15,
                          height: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                              .1,
                            ),
                            shape: BoxShape.circle),
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          "assets/Vector(1).svg",
                          color: Colors.grey,
                          width: 15,
                          height: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ReportsButton(
                              onPressed: () {
                                // dashBoardController.selectedReport(0);
                                controller.selectedReport = (0);
                              },
                              active:
                                  controller.selectedReport == 0 ? true : false,
                              label: strings.weekly),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReportsButton(
                              active:
                                  controller.selectedReport == 1 ? true : false,
                              onPressed: () {
                                controller.selectedReport = (1);
                                // dashBoardController.selectedReport(1);
                              },
                              label: strings.monthly),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ReportsButton(
                              active:
                                  controller.selectedReport == 2 ? true : false,
                              onPressed: () {
                                controller.selectedReport = (2);
                                // dashBoardController.selectedReport(2);
                              },
                              label: strings.annual),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green.shade800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(
                              () => Text(
                                "Present [${controller.selectedReport == 0 ? controller.weekly['present'] : controller.monthly['presentCount']}]",
                                style: AppTextStyles.medium.copyWith(
                                    fontSize: 11, color: Colors.green.shade700),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(() => Text(
                                  "Absent [${controller.selectedReportType.value == 0 ? controller.weekly['absent'] : controller.monthly['absentcount'].toString()}]",
                                  style: AppTextStyles.medium.copyWith(
                                      fontSize: 11, color: Colors.grey),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Obx(
                              () => Text(
                                "Leave [${controller.selectedReport == 0 ? controller.weekly['leave'] : controller.monthly['leavecount']}]",
                                style: AppTextStyles.medium
                                    .copyWith(fontSize: 11, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => controller.selectedReport == 2
                        ? SizedBox(
                            height: 31,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, i) => Obx(
                                () => Container(
                                  margin: REdgeInsets.only(right: 27.5),
                                  width: 41.w,
                                  child: InkWell(
                                    onTap: () {
                                      controller.changeSelectedYear(i);
                                    },
                                    child: Text(
                                      // (Get.locale! == const Locale('en', 'US'))
                                      //     ?
                                      DateFormat("yyyy")
                                          .format(DateTime((now.year) - i))
                                      // : ""
                                      ,
                                      style: TextStyle(
                                          color:
                                              controller.selectedYear.value ==
                                                      ((now.year) - i)
                                                  ? Colors.green
                                                  : Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                        : controller.selectedReport == 1
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      12,
                                      (index) => InkWell(
                                            onTap: () {
                                              // controller.selectMonth(index);

                                              // dashBoardController
                                              //     .selectedMonth(index + 1);
                                            },
                                            child: SizedBox(
                                                width: 48.w,
                                                height: 31.h,
                                                child: Text(
                                                  DateFormat("MMM dd").format(
                                                      DateTime(now.year,
                                                          index + 1, now.day)),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: dashBoardController
                                                                  .selectedMonth
                                                                  .value ==
                                                              index + 1
                                                          ? Colors.green
                                                          : Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          )),
                                ),
                              )
                            : Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Obx(
                                            () => WeekButton(
                                                onPressed: () {
                                                  // if(now.day ~/ 7 + 1)
                                                  // dashBoardController
                                                  //     .selectedWeek(0);
                                                },
                                                label: "WEEK 1",
                                                active: dashBoardController
                                                            .selectedWeek
                                                            .value ==
                                                        0
                                                    ? true
                                                    : false),
                                          ),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                // dashBoardController
                                                //     .selectedWeek(1);
                                              },
                                              label: "WEEK 2",
                                              active: dashBoardController
                                                          .selectedWeek.value ==
                                                      1
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                // dashBoardController
                                                //     .selectedWeek(2);
                                              },
                                              label: "WEEK 3",
                                              active: dashBoardController
                                                          .selectedWeek.value ==
                                                      2
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                // dashBoardController
                                                //     .selectedWeek(3);
                                              },
                                              label: "WEEK 4",
                                              active: dashBoardController
                                                          .selectedWeek.value ==
                                                      3
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                // dashBoardController
                                                //     .selectedWeek(4);
                                              },
                                              label: "WEEK 5",
                                              active: dashBoardController
                                                          .selectedWeek.value ==
                                                      4
                                                  ? true
                                                  : false)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Obx(
                                      () => controller.loading.isTrue
                                          ? const CircularProgressIndicator()
                                          : SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                      dashBoardController
                                                                  .selectedWeek
                                                                  .value ==
                                                              4
                                                          ? (DateTime(now.year, now.month + 1)
                                                                  .difference(DateTime(
                                                                      now.year,
                                                                      now
                                                                          .month))
                                                                  .inDays) -
                                                              27
                                                          : 7,
                                                      (index) => WeekDay(
                                                          day: weekDay[index],
                                                          isActive: controller
                                                                  .loadingSuccess
                                                                  .isTrue
                                                              ? controller.weekly[
                                                                      'weekdata ']
                                                                  .containsKey(weekDay[index].capitalizeFirst)
                                                              : false,
                                                          date: dashBoardController.selectedWeek.value == 0
                                                              ? index + 1
                                                              : dashBoardController.selectedWeek.value == 1
                                                                  ? (7 + index)
                                                                  : dashBoardController.selectedWeek.value == 2
                                                                      ? (14 + index)
                                                                      : dashBoardController.selectedWeek.value == 3
                                                                          ? (21 + index)
                                                                          : dashBoardController.selectedWeek.value == 4
                                                                              ? (28 + index)
                                                                              : (32 + index)))),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Descirption",
                        style: AppTextStyles()
                            .large
                            .copyWith(fontSize: 14, color: AppColors.primary),
                      ),
                      const Spacer(),
                      // Text(
                      //   "Amount",
                      //   style: AppTextStyles()
                      //       .large
                      //       .copyWith(fontSize: 14, color: AppColors.primary),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => controller.selectedReport == 2
                      ? controller.loading.isTrue
                          ? const CircularProgressIndicator()
                          : Column(
                              children: [
                                ...List.generate(
                                  controller.yearly['data'].length,
                                  (i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: DescriptionItem(
                                        label: DateFormat('MMMM')
                                            .format(DateTime(2023, i + 1)),
                                        value:
                                            '${controller.yearly['data'][i]['total_earning']} '),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total",
                                      style: AppTextStyles().large.copyWith(
                                          fontSize: 14,
                                          color: AppColors.primary),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${controller.yearlyTotal()}/-",
                                      style: AppTextStyles().large.copyWith(
                                          fontSize: 14,
                                          color: AppColors.primary),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            )
                      : Column(
                          children: [
                            DescriptionItem(label: strings.salary, value: ' '),
                            const SizedBox(
                              height: 5,
                            ),
                            DescriptionItem(
                                label: strings.overtime, value: ' '),
                            const SizedBox(
                              height: 5,
                            ),
                            DescriptionItem(label: strings.bonus, value: ' '),
                            const SizedBox(
                              height: 5,
                            ),
                            DescriptionItem(
                                label: strings.allowance, value: ' '),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() => controller.selectedReport == 1
                                ? Column(
                                    children: [
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DescriptionItem(
                                          label: strings.tax, value: '  '),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DescriptionItem(
                                          label: strings.penalty, value: ''),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                : const SizedBox()),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  strings.balance,
                                  style: AppTextStyles().large.copyWith(
                                      fontSize: 14, color: AppColors.primary),
                                ),
                                const Spacer(),
                                Text(
                                  " ",
                                  style: AppTextStyles().large.copyWith(
                                      fontSize: 14, color: AppColors.primary),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Obx(() => controller.selectedReport == 1
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            strings.leave_information,
                                            style: AppTextStyles()
                                                .large
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.primary),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DescriptionItem(
                                          label: strings.sick_leave,
                                          value: ' '),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      DescriptionItem(
                                          label: strings.extra_leave,
                                          value: ' '),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            strings.remaining_leave,
                                            style: AppTextStyles()
                                                .large
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.primary),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "17 days",
                                            style: AppTextStyles()
                                                .large
                                                .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.primary),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : const SizedBox()),
                          ],
                        )),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({Key? key, required this.label, this.value = ''})
      : super(key: key);
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.medium,
        ),
        const Spacer(),
        Text(
          value.toString(),
          style: AppTextStyles.medium,
        )
      ],
    );
  }
}

class WeekDay extends StatelessWidget {
  const WeekDay(
      {Key? key,
      required this.day,
      required this.date,
      this.onPressed,
      this.isActive})
      : super(key: key);
  final String day;
  final int date;
  final isActive;
  final onPressed;
  bool isLeave() {
    var leave = (day == "SUN" || day == "SAT") ? true : false;
    return leave;
  }

  @override
  Widget build(BuildContext context) {
    bool isEmployer = isActive != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            day,
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: isEmployer
                    ? isActive
                        ? Colors.green
                        : isLeave()
                            ? Colors.red
                            : Colors.grey
                    : Colors.green),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            date.toString(),
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: isEmployer
                  ? isActive
                      ? Colors.green
                      : isLeave()
                          ? Colors.red
                          : Colors.grey
                  : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class WeekButton extends StatelessWidget {
  const WeekButton(
      {Key? key, this.active = false, required this.label, this.onPressed})
      : super(key: key);
  final onPressed;
  final bool active;
  final String label;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.transparent)),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppTextStyles.b2
            .copyWith(fontSize: 10, color: active ? Colors.green : Colors.grey),
      ),
    );
  }
}

class ReportsButton extends StatelessWidget {
  const ReportsButton(
      {Key? key, this.onPressed, required this.label, this.active = false})
      : super(key: key);
  final onPressed;
  final String label;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onPressed,
      child: Container(
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? Colors.green.shade800 : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
            // border: Border.all(color: Colors.grey.shade200),
          ),
          child: RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                style: TextStyle(
                    fontSize: 10,
                    color: active
                        ? Colors.white
                        : const Color.fromRGBO(0, 0, 0, 0).withOpacity(.4)),
              ))),
    );
  }
}
