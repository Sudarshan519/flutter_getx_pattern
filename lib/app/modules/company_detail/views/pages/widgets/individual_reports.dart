import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/custom_paint/circular_progress_paint.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import 'package:intl/intl.dart';

class IndividualReport extends StatelessWidget {
  const IndividualReport({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: AppBottomSheet(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        /// TITLE
        TitleWidget(title: strings.individual_reports),

        ///  GAP
        const SizedBox(
          height: 18,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            /// NAME DETAIL
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nitesh Shrestha",
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
                Spacer(),
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
                SizedBox(
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
            const SizedBox(
              height: 24,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade800),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${strings.present.split(" ").first} [4]",
                    style: AppTextStyles.medium
                        .copyWith(fontSize: 11, color: Colors.green.shade700),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${strings.absent} [1]",
                    style: AppTextStyles.medium
                        .copyWith(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Leave [1]",
                    style: AppTextStyles.medium
                        .copyWith(fontSize: 11, color: Colors.red),
                  ),
                ],
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => controller.selectedReport.value == 2
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
                                controller.selectedYear((now.year) - i);
                              },
                              child: Text(
                                // (Get.locale! == const Locale('en', 'US'))
                                //     ?
                                DateFormat("yyyy")
                                    .format(DateTime((now.year) - i))
                                // : ""
                                ,
                                style: TextStyle(
                                    color: controller.selectedYear.value ==
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
                  : controller.selectedReport.value == 1
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                12,
                                (index) => InkWell(
                                      onTap: () {
                                        controller.selectedMonth(index + 1);
                                      },
                                      child: SizedBox(
                                          width: 48.w,
                                          height: 31.h,
                                          child: Text(
                                            DateFormat("MMM dd").format(
                                                DateTime(now.year, index + 1,
                                                    now.day)),
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: controller.selectedMonth
                                                            .value ==
                                                        index + 1
                                                    ? Colors.green
                                                    : Colors.grey,
                                                fontWeight: FontWeight.w600),
                                          )),
                                    )),
                          ),
                        )
                      : Column(
                          children: [
                            controller.selectedReport.value == 5
                                ? SizedBox()
                                : SizedBox(
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
                                                  controller.selectedWeek(0);
                                                },
                                                label: "WEEK 1",
                                                active: controller.selectedWeek
                                                            .value ==
                                                        0
                                                    ? true
                                                    : false),
                                          ),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                controller.selectedWeek(1);
                                              },
                                              label: "WEEK 2",
                                              active: controller
                                                          .selectedWeek.value ==
                                                      1
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                controller.selectedWeek(2);
                                              },
                                              label: "WEEK 3",
                                              active: controller
                                                          .selectedWeek.value ==
                                                      2
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                controller.selectedWeek(3);
                                              },
                                              label: "WEEK 4",
                                              active: controller
                                                          .selectedWeek.value ==
                                                      3
                                                  ? true
                                                  : false)),
                                          Obx(() => WeekButton(
                                              onPressed: () {
                                                controller.selectedWeek(4);
                                              },
                                              label: "WEEK 5",
                                              active: controller
                                                          .selectedWeek.value ==
                                                      4
                                                  ? true
                                                  : false)),
                                        ],
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 40,
                              child: Obx(
                                () => SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                          controller.selectedWeek.value == 4
                                              ? 3
                                              : 7,
                                          (index) => WeekDay(
                                              isActive:
                                                  (index == 2) ? true : false,
                                              onPressed: () {},
                                              day: weekDay[index],
                                              date: controller
                                                          .selectedWeek.value ==
                                                      0
                                                  ? index + 1
                                                  : controller.selectedWeek
                                                              .value ==
                                                          1
                                                      ? (7 + index)
                                                      : controller.selectedWeek
                                                                  .value ==
                                                              2
                                                          ? (14 + index)
                                                          : controller.selectedWeek
                                                                      .value ==
                                                                  3
                                                              ? (21 + index)
                                                              : controller.selectedWeek
                                                                          .value ==
                                                                      4
                                                                  ? (28 + index)
                                                                  : (32 +
                                                                      index)))),
                                ),
                              ),
                            ),
                          ],
                        ),
            ),
            Obx(() => controller.selectedReport.value == 5
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "09:08:12 AM",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SvgPicture.asset(
                              "assets/material-symbols_arrow-insert-rounded.svg"),
                          Spacer(),
                          Text(
                            "09:08:12 PM",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SvgPicture.asset(
                              "assets/material-symbols_arrow-insert-rounded(1).svg"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  strings.breaks,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  "00:46:02",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 155,
                              width: 200,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    right: 40,
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      padding: const EdgeInsets.all(18),
                                      child: CustomPaint(
                                        painter: CircularPercentPaint(
                                          allGreen: true,
                                          progress: 70.toInt(),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              strings.total_hours,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green.shade800),
                                            ),
                                            Text(
                                              "12:42:05",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 155 / 2 - 5,
                                      right: 0,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            "assets/Group 105.svg",
                                            height: 24,
                                            width: 30.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6.0),
                                            child: Text(
                                              "70 %",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Earning ",
                            style: TextStyle(color: Colors.blueGrey.shade600),
                          ),
                          Text(
                            "8300 /-",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )
                : SizedBox()),
            SizedBox(
              height: 20,
            ),
            Obx(() => controller.selectedReport.value == 5
                ? SizedBox()
                // : controller.selectedReport.value == 2
                //     ? Column(
                //         children: [
                //           Text(
                //             strings.annual_leave_summary,
                //             style: AppTextStyles()
                //                 .large
                //                 .copyWith(fontSize: 14, color: AppColors.primary),
                //           ),
                //         ],
                //       )
                : Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Descirption",
                            style: AppTextStyles().large.copyWith(
                                fontSize: 14, color: AppColors.primary),
                          ),
                          Spacer(),
                          Text(
                            "Amount",
                            style: AppTextStyles().large.copyWith(
                                fontSize: 14, color: AppColors.primary),
                          ),
                        ],
                      ),
                      Divider(thickness: 2),
                      SizedBox(
                        height: 5,
                      ),
                      Obx(() => controller.selectedReport == 2
                          ? Column(
                              children: [
                                ...List.generate(
                                  12,
                                  (i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: DescriptionItem(
                                        label: DateFormat('MMMM')
                                            .format(DateTime(2023, i + 1)),
                                        value: 6000),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
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
                                    Spacer(),
                                    Text(
                                      "2,40,000/-",
                                      style: AppTextStyles().large.copyWith(
                                          fontSize: 14,
                                          color: AppColors.primary),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                DescriptionItem(
                                    label: strings.salary, value: 6000),
                                SizedBox(
                                  height: 5,
                                ),
                                DescriptionItem(
                                    label: strings.overtime, value: 6000),
                                SizedBox(
                                  height: 5,
                                ),
                                DescriptionItem(
                                    label: strings.bonus, value: 6000),
                                SizedBox(
                                  height: 5,
                                ),
                                DescriptionItem(
                                    label: strings.allowance, value: 6000),
                                SizedBox(
                                  height: 5,
                                ),
                                Obx(() => controller.selectedReport.value == 1
                                    ? Column(
                                        children: [
                                          Divider(
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          DescriptionItem(
                                              label: strings.tax, value: 6000),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          DescriptionItem(
                                              label: strings.penalty,
                                              value: 6000),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      )
                                    : SizedBox()),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      strings.balance,
                                      style: AppTextStyles().large.copyWith(
                                          fontSize: 14,
                                          color: AppColors.primary),
                                    ),
                                    Spacer(),
                                    Text(
                                      " 21500",
                                      style: AppTextStyles().large.copyWith(
                                          fontSize: 14,
                                          color: AppColors.primary),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Obx(() => controller.selectedReport.value == 1
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
                                                        color:
                                                            AppColors.primary),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          DescriptionItem(
                                              label: strings.sick_leave,
                                              value: 6000),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          DescriptionItem(
                                              label: strings.extra_leave,
                                              value: 6000),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          SizedBox(
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
                                                        color:
                                                            AppColors.primary),
                                              ),
                                              Spacer(),
                                              Text(
                                                "17 days",
                                                style: AppTextStyles()
                                                    .large
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color:
                                                            AppColors.primary),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : SizedBox()),
                              ],
                            ))
                    ],
                  )),

            Obx(() => controller.selectedReport.value == 1 ||
                    controller.selectedReport.value == 2
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        isMultiline: true,
                        title: strings.send_notification,
                        hint: strings.message,
                      ),
                    ],
                  )),
            SizedBox(
              height: 20,
            ),
            CustomButton(onPressed: () {}, label: strings.add),
            SizedBox(
              height: 20,
            ),
          ]),
        )
      ])),
    );
  }
}
