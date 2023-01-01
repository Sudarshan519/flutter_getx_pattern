import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        body: Column(
      children: [
        SizedBox(
          height: 94,
        ),
        Text(
          "Welcome to",
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.primary),
        ),
        SizedBox(
          height: 60,
        ),
        Image.asset(
          AppImages.logo,
          height: 60,
          width: 178,
        ),
        const SizedBox(
          height: 17,
        ),
        Text(
          "Smart Attendance System",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
              color: AppColors.primary),
        ),
        SizedBox(
          height: 106,
        ),
        WelcomeSlider(),
        SizedBox(
          height: 89,
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
                      Get.toNamed(Routes.LOGIN, arguments: false);
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
    ));
  }
}

class WelcomeSlider extends StatelessWidget {
  const WelcomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final WelcomeController controller = Get.find();
    return SizedBox(
      height: 112,
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
                      style: const TextStyle(
                          fontSize: 14, color: Colors.grey, height: 1.4),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            3,
                            (index) => AnimatedContainer(
                                  height: 12,
                                  width: 12,
                                  margin: const EdgeInsets.only(right: 8),
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
