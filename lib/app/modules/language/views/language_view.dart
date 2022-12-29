import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_constants.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/app/utils/custom_paint/arc_painter.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  CustomPaint(
                      size: Size(Get.width, (Get.width * 0.812).toDouble()),
                      painter: ArcPainter(color: AppColors.deepOrange)),
                  Positioned(
                      left: 47,
                      top: 128,
                      right: 47,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          height: 281,
                          width: 281,
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromRGBO(255, 80, 80, .19),
                                      Color.fromRGBO(236, 236, 236, 0)
                                    ]),
                                shape: BoxShape.circle),
                            height: 257,
                            width: 257,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.logo,
                                  height: 60,
                                  width: 178,
                                )
                              ],
                            ),
                          ))),
                  Positioned(
                      top: 503,
                      left: 16,
                      right: 16,
                      child: Column(
                        children: [
                          const Text(
                            "Choose your language",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                              onPressed: () {
                                Get.offNamed(Routes.WELCOME);
                              },
                              label: "English"),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "Or",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          CustomButton(
                              onPressed: () {},
                              label: "Nepali",
                              color: AppColors.red)
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.color = const Color.fromRGBO(34, 64, 139, 1)})
      : super(key: key);
  final Function() onPressed;
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: color),
          onPressed: onPressed,
          child:
              Text(label, style: const TextStyle(fontWeight: FontWeight.w700))),
    );
  }
}
