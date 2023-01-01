import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/modules/login/views/login_view.dart';
import 'package:hajir/app/routes/app_pages.dart';
import '../controllers/mobile_opt_controller.dart';

class MobileOptView extends GetView<MobileOptController> {
  const MobileOptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          HajirLogo(),
          SizedBox(
            height: 84.h,
          ),
          SizedBox(
            height: 170,
            width: 170,
            child: Stack(children: [
              Image.asset("assets/Group 89.png"),
              Positioned(
                top: 36,
                left: 33,
                right: 32.38,
                bottom: 36.77,
                child: SvgPicture.asset(
                  "assets/Device.svg",
                  width: 104.62,
                  height: 97.23,
                ),
              ),
              Positioned(
                  top: 99,
                  right: 11.05,
                  bottom: 36.29,
                  child: SvgPicture.asset("assets/Plant.svg")),
            ]),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "OPT Verification",
            style: AppTextStyles.regular.copyWith(color: AppColors.primary),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            """Enter the OPT sent to""",
            textAlign: TextAlign.center,
            style: AppTextStyles.medium,
          ),
          Text(
            "+977-9818124202",
            textAlign: TextAlign.center,
            style: AppTextStyles.medium.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 50,
          ),
          OtpTextField(
            borderWidth: 1,
            fieldWidth: 48,
            numberOfFields: 5,
            borderColor: Colors.grey.shade300,
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: Text("Verification Code"),
              //         content: Text('Code entered is $verificationCode'),
              //       );
              //     });
            }, // end onSubmit
          ),
          SizedBox(
            height: 44,
          ),
          CustomButton(
              onPressed: () {
                if (Get.arguments) {
                  Get.toNamed(Routes.EMPLOYER_DASHBOARD);
                } else {
                  Get.toNamed(Routes.DASHBOARD);
                }
              },
              label: "Verify"),
          SizedBox(
            height: 25,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "Do not receive OTP? ", style: AppTextStyles.l2),
            TextSpan(
                text: "  Resent OTP in 2:59",
                style: AppTextStyles.l2.copyWith(color: Colors.red))
          ])),
          SizedBox(
            height: 94,
          ),
        ],
      ),
    ));
  }
}
