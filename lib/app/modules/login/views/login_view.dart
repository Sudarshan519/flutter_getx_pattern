import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_constants.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/modules/login/models/carousel_item.dart';
import 'package:hajir/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            HajirLogo(),
            const SizedBox(
              height: 84,
            ),
            SizedBox(
              height: 230,
              width: double.infinity,
              child: CarouselSlider(
                  items: List.generate(
                      candidateItems.length,
                      (index) => Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  candidateItems[index].icon,
                                  height: 170,
                                  width: 170,
                                ),
                                Text(
                                  candidateItems[index].label,
                                  style: AppTextStyles.medium
                                      .copyWith(height: 1.4),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                  options: CarouselOptions(
                      onPageChanged: (index, reason) =>
                          controller.selectedItem = index,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      autoPlay: true)),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  candidateItems.length,
                  (index) => Obx(
                        () => AnimatedContainer(
                          duration: 300.milliseconds,
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: controller.selectedItem == index
                                  ? Colors.grey
                                  : Colors.grey.shade200,
                              shape: BoxShape.circle),
                          margin: const EdgeInsets.only(right: 8),
                        ),
                      )),
            ),
            const SizedBox(
              height: 60,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          SvgPicture.asset(
                            "assets/twemoji_flag-nepal.svg",
                            height: 22,
                            width: 22,
                          ),
                          Text(
                            "+977",
                            style: AppTextStyles.l1,
                          ),
                        ]),
                      ),
                      Container(
                        height: 56,
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  hintText: "Mobile Number",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onPressed: () {
                  Get.toNamed(Routes.MOBILE_OPT);
                },
                label: "Get OTP"),
            const SizedBox(
              height: 20,
            ),
            Text("We wil sen you an one time password on this mobile number",
                style: AppTextStyles.l2),
            const SizedBox(
              height: 5,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "I have read and agree ",
                style: AppTextStyles.l2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              TextSpan(text: "Terms & Services", style: AppTextStyles.l2)
            ])),
          ],
        ),
      ),
    ));
  }
}

class HajirLogo extends StatelessWidget {
  const HajirLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: 36,
      width: 106,
    );
  }
}
