
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/inbox/views/inbox_detail.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/inbox_controller.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const BackButton(),
              Text(
                strings.inbox,
                style: AppTextStyles.b1.copyWith(fontSize: 24.sp),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (_, i) => Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {
                            Get.to(() => const InboxDetail());
                          },
                          child: Container(
                            height: 74,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(6),
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade200)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/Mask group(1).png",
                                  height: 64,
                                  width: 64,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nitesh Shrestha",
                                        style: AppTextStyles.b1,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Text(
                                              strings.sick_leave,
                                              style: TextStyle(
                                                  color: Colors.grey.shade600),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "31 Dec, 2022",
                                              style: AppTextStyles.body,
                                              // style: TextStyle(
                                              //     color: Colors.grey.shade600,),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )))
        ],
      ),
    ));
  }
}
