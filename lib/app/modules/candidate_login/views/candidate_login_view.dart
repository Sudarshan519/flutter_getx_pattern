import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/charts/line_chart.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/clock_painter.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/app/utils/custom_paint/arc_painter.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import 'package:intl/intl.dart';
import '../controllers/candidate_login_controller.dart';
import 'widgets/custom_paint/circular_progress_paint.dart';

class CandidateLoginView extends GetView<CandidateLoginController> {
  const CandidateLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return SizedBox(
      height: 812,
      child: Stack(children: [
        SizedBox(
          height: 229,
          width: double.infinity,
          child: CustomPaint(
            painter: ArcPainter(color: Colors.grey),
          ),
        ),
        Positioned(
            top: 78,
            left: 80,
            right: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  strings.today,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: AppColors.red),
                ),
                SizedBox(
                  height: 10.r,
                ),
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff555555)),
                ),
              ],
            )),
        Positioned(
            top: 151,
            left: 80,
            right: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 155,
                    width: 155,
                    padding: const EdgeInsets.all(11),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Obx(
                      () => !controller.isAuthenticated
                          ? Container(
                              height: 155,
                              width: 155,
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                  // color: Colors.grey.withOpacity(.1),
                                  shape: BoxShape.circle),
                              child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Transform.rotate(
                                      angle: -pi / 2, child: const Clock())),
                            )
                          : Obx(
                              () => Stack(
                                children: [
                                  // SemiCircleWidget(
                                  //   sweepAngle: 80,
                                  //   color: Colors.green,
                                  // ),
                                  // SemiCircleWidget(
                                  //   sweepAngle: 0,
                                  //   color: Colors.yellow,
                                  // ),
                                  // SemiCircleWidget(
                                  //   sweepAngle: 0,
                                  //   color: Colors.green,
                                  // ),
                                  Container(
                                    height: 155,
                                    width: 155,
                                    padding: const EdgeInsets.all(18),
                                    decoration: const BoxDecoration(
                                        // color: Colors.grey.withOpacity(.1),
                                        shape: BoxShape.circle),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Transform.rotate(
                                            angle: -pi / 2,
                                            child: const Clock())),
                                  ),

                                  Container(
                                    height: 155,
                                    width: 155,
                                    padding: const EdgeInsets.all(18),
                                    child: CustomPaint(
                                      painter: CircularPercentPaint(
                                          progress: controller.percentage.value
                                              .toInt(),
                                          isFirstHalf: false),
                                    ),
                                  ),

                                  /// draw break
                                  Container(
                                    height: 155,
                                    width: 155,
                                    padding: const EdgeInsets.all(18),
                                    child: CustomPaint(
                                      painter: CircularPercentPaint(
                                          progress: controller.percentage.value
                                                      .toInt() >
                                                  60
                                              ? 60
                                              : controller.percentage.value
                                                  .toInt(),
                                          isBreak: true),
                                    ),
                                  ),
                                  Container(
                                    height: 155,
                                    width: 155,
                                    padding: const EdgeInsets.all(18),
                                    child: CustomPaint(
                                      painter: CircularPercentPaint(
                                        progress:
                                            controller.percentage.value.toInt(),
                                      ),
                                    ),
                                  ),

                                  //     if (controller.isloggedIn)
                                  //       SizedBox(
                                  //         height: 155,
                                  //         width: 155,
                                  //         child: Obx(
                                  //           (() => CircularPercentIndicator(
                                  //                 animationDuration: 300,
                                  //                 backgroundColor:
                                  //                     Colors.grey.withOpacity(.1),
                                  //                 radius: 65.0,
                                  //                 lineWidth: 14.0,
                                  //                 percent: controller.percentage.value,
                                  //                 circularStrokeCap: CircularStrokeCap.round,
                                  //                 // center: new Text("100%"),
                                  //                 progressColor: Colors.green,
                                  //               )),
                                  //         ),
                                  //       ),
                                  //     Transform.rotate(
                                  //       angle: pi / 4 * 180,
                                  //       child: SizedBox(
                                  //         height: 155,
                                  //         width: 155,
                                  //         child: CircularPercentIndicator(
                                  //           backgroundColor: Colors.grey.withOpacity(.1),
                                  //           radius: 65.0,
                                  //           lineWidth: 14.0,
                                  //           percent: .0,
                                  //           circularStrokeCap: CircularStrokeCap.square,
                                  //           progressColor: Colors.yellow,
                                  //         ),
                                  //       ),
                                  //     ),
                                ],
                              ),
                            ),
                    )),
                const Positioned(
                    top: 70, left: 47, right: 47, child: TimeWidget()),
              ],
            )),
        Positioned(
            top: 317,
            left: 18,
            right: 18,
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 48,
                  width: 200,
                  child: Obx(() => controller.authStatus ==
                          AuthStatus.Authenticated
                      ? OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red.shade800),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              )),
                          onPressed: () {
                            controller.logout();
                          },
                          child: Text(
                            strings.logout,
                            style:
                                AppTextStyles.b2.copyWith(color: AppColors.red),
                          ))
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            "Login",
                            style: AppTextStyles.b1,
                          ))),
                ),
                Obx(
                  () => controller.authStatus == AuthStatus.Authenticated
                      ? Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                controller.breakStarted.toggle();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.breakStarted.value
                                        ? strings.stop_break
                                        : strings.start_break,
                                    style: AppTextStyles.medium.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600),
                                  ),
                                  SvgPicture.asset(
                                    "assets/codicon_debug-start.svg",
                                    height: 16,
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text("😊"),
                            Text(
                              strings.todays_earning,
                              style: AppTextStyles.medium
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            SizedBox(
                              height: 154,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CandidateIncomeItem(),
                                    CandidateIncomeItem(),
                                    CandidateIncomeItem(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Dot(),
                                    CandidateIncomeItem(),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Obx(() => CandidateIncomeItem(
                                            gradientTop: true,
                                            value: controller.d1.value == 0
                                                ? 9
                                                : controller.d1.value - 1)),
                                        Spacer(),
                                        Obx(() => CandidateIncomeItem(
                                            value: controller.d1.value)),
                                        Spacer(),
                                        Obx(
                                          () => CandidateIncomeItem(
                                              gradientBottom: true,
                                              value: (controller.d1.value +
                                                          1) ==
                                                      10
                                                  ? 0
                                                  : (controller.d1.value + 1)),
                                        ),
                                      ],
                                    )
                                  ]),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                strings.income_history,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff555555)),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 248,
                              child: LineChart(),
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
                                        color: Color.fromRGBO(236, 237, 240, 1),
                                        blurRadius: 2)
                                  ],
                                  color:
                                      const Color.fromRGBO(236, 237, 240, 1)),
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
                                                borderRadius:
                                                    BorderRadius.circular(7.r),
                                                color: controller.selected == 0
                                                    ? Colors.white
                                                    : Colors.transparent),
                                            height: 32.h,
                                            width: double.infinity,
                                            child: Text(
                                              strings.weekly,
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
                                                borderRadius:
                                                    BorderRadius.circular(7.r),
                                                color: controller.selected == 1
                                                    ? Colors.white
                                                    : Colors.transparent),
                                            height: 32.h,
                                            width: double.infinity,
                                            child: Text(
                                              strings.monthly,
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
                                                borderRadius:
                                                    BorderRadius.circular(7.r),
                                                color: controller.selected == 2
                                                    ? Colors.white
                                                    : Colors.transparent),
                                            height: 32.h,
                                            width: double.infinity,
                                            child: Text(
                                              strings.annual,
                                              style: AppTextStyles.b2,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                )
              ],
            )),
        Positioned(
          right: 0,
          child: SafeArea(
            child: IconButton(
                onPressed: () {},
                icon: SizedBox(
                    height: 24,
                    width: 24,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/notification.svg",
                          height: 24,
                          width: 24,
                        ),
                        Positioned(
                          top: 3,
                          right: 0,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ))),
          ),
        )
      ]),
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      ".",
      style: AppTextStyles().large.copyWith(color: AppColors.primary),
    );
  }
}

class CandidateIncomeItem extends StatelessWidget {
  const CandidateIncomeItem(
      {Key? key,
      this.gradientTop = false,
      this.gradientBottom = false,
      this.value = 0})
      : super(key: key);
  final bool gradientTop;
  final bool gradientBottom;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 9,
      ),
      height: 46,
      width: 33.95,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.57143),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                if (gradientTop) ...[
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(41, 100, 255, 1),
                ] else
                  ...[],
                Color.fromRGBO(41, 100, 255, 1),
                gradientBottom
                    ? Color.fromRGBO(255, 255, 255, 1)
                    : Color.fromRGBO(34, 64, 139, 1)
              ])),
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.57143),
                    topRight: Radius.circular(6.57143),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: gradientTop
                          ? [Colors.white, Colors.white24]
                          : [
                              Color.fromRGBO(34, 64, 139, 1),
                              Color.fromRGBO(41, 100, 255, 1),
                            ])),
              height: 26,
              width: 34,
            )),
        Text(
          value.toString(),
          style: AppTextStyles().large,
        )
      ]),
    );
  }
}

class TimeWidget extends StatefulWidget {
  const TimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  var now = DateTime.now();
  late Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(1.seconds, (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('hh:mm a').format(now),
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  var now = DateTime.now();
  late Timer timer;
  final CandidateLoginController controller = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // timer = Timer.periodic(1.seconds, (timer) {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomPaint(
          painter: ClockPainter(controller.now.value),
        ));
  }
}
