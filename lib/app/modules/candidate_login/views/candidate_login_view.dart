import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/candidate_login/views/widgets/clock_painter.dart';
import 'package:hajir/app/utils/custom_paint/arc_painter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../controllers/candidate_login_controller.dart';

class CandidateLoginView extends GetView<CandidateLoginController> {
  const CandidateLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(
          height: Get.height,
          child: Stack(children: [
            SizedBox(
              height: 229.h,
              width: double.infinity,
              child: CustomPaint(
                painter: ArcPainter(color: Colors.grey),
              ),
            ),
            Positioned(
                top: 78.h,
                left: 136.w,
                right: 136.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Today",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34.sp,
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
                top: 151.h,
                left: 110.w,
                right: 110.w,
                child: Stack(
                  children: [
                    Container(
                        height: 155,
                        width: 155,
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Stack(
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
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  color: Colors.grey.withOpacity(.1),
                                  shape: BoxShape.circle),
                              child: Container(
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Transform.rotate(
                                      angle: -pi / 2, child: Clock())),
                            ),
                            SizedBox(
                              height: 155,
                              width: 155,
                              child: Obx(
                                (() => CircularPercentIndicator(
                                      animationDuration: 300,
                                      backgroundColor:
                                          Colors.grey.withOpacity(.1),
                                      radius: 65.0,
                                      lineWidth: 14.0,
                                      percent: controller.percentage.value,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      // center: new Text("100%"),
                                      progressColor: Colors.green,
                                    )),
                              ),
                            ),
                            Transform.rotate(
                              angle: pi / 4 * 180,
                              child: SizedBox(
                                height: 155,
                                width: 155,
                                child: CircularPercentIndicator(
                                  backgroundColor: Colors.grey.withOpacity(.1),
                                  radius: 65.0,
                                  lineWidth: 14.0,
                                  percent: .0,
                                  circularStrokeCap: CircularStrokeCap.square,
                                  // center: new Text("100%"),
                                  progressColor: Colors.yellow,
                                ),
                              ),
                            ),
                          ],
                        )),
                    const Positioned(
                        top: 70, left: 47, right: 47, child: TimeWidget()),
                  ],
                )),
            Positioned(
                top: 317.r,
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
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: AppTextStyles.b1,
                          )),
                    ),
                    SizedBox(
                      height: 103,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Income History",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff555555)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      height: 148.h,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      height: 36.h,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(236, 237, 240, 1),
                                blurRadius: 2)
                          ],
                          color: Color.fromRGBO(236, 237, 240, 1)),
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
                                      "Weekly",
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
                                      "Monthly",
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
                                      "Annual",
                                      style: AppTextStyles.b2,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ]),
        ),
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
          // Text(DateFormat('hh:mm a').format(DateTime.now())),
        ));
  }
}
