import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class InboxDetail extends StatelessWidget {
  const InboxDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              // BackButton(),
              // SizedBox(
              //   width: 20,
              // ),
              Text(
                strings.details,
                style: AppTextStyles.b1.copyWith(fontSize: 24.sp),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nitesh Shrestha",
            style: AppTextStyles.b1,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "31 Dec, 2022",
            style: AppTextStyles.body.copyWith(fontSize: 14.sp),
            // style: TextStyle(
            //     color: Colors.grey.shade600,),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            """Dear sir,

I would like to apply for paid leave and waiting for your approval.
 Thank you
Nitesh""",
            textAlign: TextAlign.start,
            style: AppTextStyles.body,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            strings.leave,
            style: AppTextStyles.body,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            strings.paid_leave,
            style: AppTextStyles.b1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            strings.type,
            style: AppTextStyles.body,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            strings.half_day,
            style: AppTextStyles.b1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            strings.duration,
            style: AppTextStyles.body,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "2 Jan 23 - 7 Jan 23",
            style: AppTextStyles.b1.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            strings.attached,
            style: AppTextStyles.body,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        "assets/Mask group (1).png",
                        height: 64,
                        width: 64,
                      ),
                    )),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(onPressed: () {}, label: "Approve"),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
            label: strings.cancel,
            color: Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
              color: Colors.grey,
              onPressed: () {
                Get.back();
              },
              label: strings.back_to_home),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
