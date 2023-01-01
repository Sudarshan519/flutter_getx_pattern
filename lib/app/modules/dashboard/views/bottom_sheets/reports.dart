import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:intl/intl.dart';

var weekDay = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
var now = DateTime.now();

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find();
    return AppBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleWidget(title: "Report"),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   title: Text("Nitesh Shrestha"),
                //   subtitle: Text("RT001"),
                //   trailing: Container(
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Container(
                //           decoration: BoxDecoration(
                //               color: Colors.grey.withOpacity(
                //                 .1,
                //               ),
                //               shape: BoxShape.circle),
                //           height: 30,
                //           width: 30,
                //         ),
                //         SizedBox(
                //           width: 10,
                //         ),
                //         Container(
                //           decoration: BoxDecoration(
                //               color: Colors.grey.withOpacity(
                //                 .1,
                //               ),
                //               shape: BoxShape.circle),
                //           height: 30,
                //           width: 30,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
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
                        SizedBox(
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
                      ReportsButton(
                          onPressed: () {
                            controller.selectedReport(0);
                          },
                          active: controller.selectedReport.value == 0
                              ? true
                              : false,
                          label: "WEEKLY"),
                      ReportsButton(
                          active: controller.selectedReport.value == 1
                              ? true
                              : false,
                          onPressed: () {
                            controller.selectedReport(1);
                          },
                          label: "MONTHLY"),
                      ReportsButton(
                          active: controller.selectedReport.value == 2
                              ? true
                              : false,
                          onPressed: () {
                            controller.selectedReport(2);
                          },
                          label: "ANNUAL"),
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
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Present [4]",
                            style: AppTextStyles.medium.copyWith(
                                fontSize: 11, color: Colors.green.shade700),
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
                            "Absent [1]",
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
                                margin: const EdgeInsets.only(right: 27.5),
                                width: 41,
                                child: InkWell(
                                  onTap: () {
                                    controller.selectedYear((now.year) - i);
                                  },
                                  child: Text(
                                    DateFormat("yyyy")
                                        .format(DateTime((now.year) - i)),
                                    style: TextStyle(
                                        color: controller.selectedYear.value ==
                                                ((now.year) - i)
                                            ? Colors.green
                                            : Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
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
                                              width: 48,
                                              height: 31,
                                              child: Text(
                                                DateFormat("MMM dd").format(
                                                    DateTime(
                                                        now.year, index + 1)),
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: controller
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => WeekButton(
                                            onPressed: () {
                                              controller.selectedWeek(0);
                                            },
                                            label: "WEEK 1",
                                            active:
                                                controller.selectedWeek.value ==
                                                        0
                                                    ? true
                                                    : false),
                                      ),
                                      Obx(() => WeekButton(
                                          onPressed: () {
                                            controller.selectedWeek(1);
                                          },
                                          label: "WEEK 2",
                                          active:
                                              controller.selectedWeek.value == 1
                                                  ? true
                                                  : false)),
                                      Obx(() => WeekButton(
                                          onPressed: () {
                                            controller.selectedWeek(2);
                                          },
                                          label: "WEEK 3",
                                          active: controller.selectedWeek.value == 2
                                              ? true
                                              : false)),
                                      Obx(() => WeekButton(
                                          onPressed: () {
                                            controller.selectedWeek(3);
                                          },
                                          label: "WEEK 4",
                                          active:
                                              controller.selectedWeek.value == 3
                                                  ? true
                                                  : false)),
                                      Obx(() => WeekButton(
                                          onPressed: () {
                                            controller.selectedWeek(4);
                                          },
                                          label: "WEEK 5",
                                          active:
                                              controller.selectedWeek.value == 4
                                                  ? true
                                                  : false)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: Obx(
                                    () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                            controller.selectedWeek == 4
                                                ? 3
                                                : 7,
                                            (index) => WeekDay(
                                                day: weekDay[index],
                                                date: controller.selectedWeek
                                                            .value ==
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
                                                                    ? (28 +
                                                                        index)
                                                                    : (32 +
                                                                        index)))),
                                  ),
                                ),
                              ],
                            ),
                ),
                SizedBox(
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
                    Spacer(),
                    Text(
                      "Amount",
                      style: AppTextStyles()
                          .large
                          .copyWith(fontSize: 14, color: AppColors.primary),
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
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
                                    fontSize: 14, color: AppColors.primary),
                              ),
                              Spacer(),
                              Text(
                                "2,40,000/-",
                                style: AppTextStyles().large.copyWith(
                                    fontSize: 14, color: AppColors.primary),
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
                          DescriptionItem(label: "Salary", value: 6000),
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionItem(label: "Overtime", value: 6000),
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionItem(label: "Bonus", value: 6000),
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionItem(label: "Allowance", value: 6000),
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
                                    DescriptionItem(label: "Tax", value: 6000),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    DescriptionItem(
                                        label: "Penalty", value: 6000),
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
                                "Balance",
                                style: AppTextStyles().large.copyWith(
                                    fontSize: 14, color: AppColors.primary),
                              ),
                              Spacer(),
                              Text(
                                " 21500",
                                style: AppTextStyles().large.copyWith(
                                    fontSize: 14, color: AppColors.primary),
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
                                          "Leave information",
                                          style: AppTextStyles().large.copyWith(
                                              fontSize: 14,
                                              color: AppColors.primary),
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
                                        label: "Sick leave", value: 6000),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    DescriptionItem(
                                        label: "Extra leave", value: 6000),
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
                                          "Remaining Leave",
                                          style: AppTextStyles().large.copyWith(
                                              fontSize: 14,
                                              color: AppColors.primary),
                                        ),
                                        Spacer(),
                                        Text(
                                          "17 days",
                                          style: AppTextStyles().large.copyWith(
                                              fontSize: 14,
                                              color: AppColors.primary),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox()),
                        ],
                      )),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.medium,
        ),
        Spacer(),
        Text(
          value.toString(),
          style: AppTextStyles.medium,
        )
      ],
    );
  }
}

class WeekDay extends StatelessWidget {
  const WeekDay({Key? key, required this.day, required this.date})
      : super(key: key);
  final String day;
  final int date;
  bool isLeave() {
    var leave = (day == "SUN" || day == "SAT") ? true : false;
    return leave;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            day,
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: isLeave() ? Colors.red : Colors.green),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            date.toString(),
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: isLeave() ? Colors.red : Colors.green),
          )
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
      style:
          OutlinedButton.styleFrom(side: BorderSide(color: Colors.transparent)),
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
    return SizedBox(
        height: 25.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor:
                    active ? Colors.green.shade800 : Colors.grey.shade200),
            onPressed: onPressed,
            child: RPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 11,
                      color: active
                          ? null
                          : Color.fromRGBO(0, 0, 0, 1).withOpacity(.4)),
                ))));
  }
}
