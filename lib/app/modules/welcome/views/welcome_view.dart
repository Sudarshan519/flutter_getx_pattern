import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_constants.dart';
import 'package:hajir/app/routes/app_pages.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            "Welcome to",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primary),
          ),
          SizedBox(
            height: 60.h,
          ),
          Image.asset(
            AppImages.logo,
            height: 60.r,
            width: 178.r,
          ),
          SizedBox(
            height: 17.r,
          ),
          Text(
            "Smart Attendance System",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primary),
          ),
          SizedBox(
            height: 80.r,
          ),
          WelcomeSlider(),
          SizedBox(
            height: 80.r,
          ),
          Text(
            "Click below to continue login as",
            style:
                TextStyle(color: AppColors.black.withOpacity(.5), fontSize: 14),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN, arguments: false);
                        },
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            bottomLeft: Radius.circular(6)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6)),
                          child: Container(
                              height: 48,
                              alignment: Alignment.center,
                              color: AppColors.red,
                              child: Text(
                                "Candidate",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN, arguments: true);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        child: Container(
                            color: AppColors.primary,
                            alignment: Alignment.center,
                            height: 48,
                            child: Text(
                              "Employer",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                      ),
                    ))
                  ],
                ),
                Center(
                    child: Container(
                        height: 48,
                        width: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Text("OR",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            )))),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}

class WelcomeSlider extends StatelessWidget {
  const WelcomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find();
    return SizedBox(
      height: 118.h,
      width: double.infinity,
      child: CarouselSlider(
        items: List.generate(
            controller.carouselItems.length,
            ((i) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.carouselItems[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp, color: Colors.grey, height: 1.4),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            3,
                            (index) => AnimatedContainer(
                                  height: 12.h,
                                  width: 12.h,
                                  margin: REdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == i
                                          ? AppColors.primary
                                          : Colors.grey.shade300),
                                  duration: 300.milliseconds,
                                )),
                      ],
                    ),
                  ],
                ))),
        options: CarouselOptions(
            enableInfiniteScroll: false, viewportFraction: 1, autoPlay: true),
      ),
    );
  }
}
