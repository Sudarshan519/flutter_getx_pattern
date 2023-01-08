import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class MyPlans extends StatelessWidget {
  const MyPlans({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: AppBottomSheet(
        child: Column(children: [
          TitleWidget(title: strings.my_plans),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                PlanItem(
                  label: "Free(Forever)",
                  controller: controller,
                  items: [
                    "Live attendance",
                    "Salary calculation",
                    "Setup private network",
                    "Payroll management",
                    "Overtime setup",
                    "Export reports",
                    "Office timing setup",
                    "Performance report",
                    "Add candidate",
                    "Add 1 company",
                    "Add custom leave",
                    "Add 5 employee"
                  ],
                ),
                PlanItem(
                  label: "Premium",
                  isPremium: true,
                  controller: controller,
                  items: [
                    'Everything from free plan +',
                    'Add unlimited employee',
                    'Add unlimited company'
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}

class PlanItem extends StatelessWidget {
  const PlanItem(
      {super.key,
      required this.label,
      this.items = const [],
      required this.controller,
      this.isPremium = false});
  final String label;
  final items;
  final bool isPremium;
  final CompanyDetailController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        // onTap: () {
        //   controller.myPlan(label);
        // },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: SizedBox(
            height: 212,
            child: Stack(
              children: [
                Container(
                  // height: 212,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: isPremium ? 1 : 3,
                          color: controller.myPlan.value == label
                              ? Colors.green.shade800
                              : Colors.grey.shade200)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: AppTextStyles.b1,
                        ),
                        Divider(),
                        Wrap(
                          children: List.generate(
                              items.length,
                              (index) => SizedBox(
                                    width: isPremium ? null : Get.width / 2.4,
                                    child: Row(
                                      mainAxisSize: isPremium
                                          ? MainAxisSize.max
                                          : MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                          child: CircleAvatar(
                                              radius: 10,
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              child: SvgPicture.asset(
                                                "assets/Group.svg",
                                                color: Colors.green.shade800,
                                              )),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          items[index],
                                          style: AppTextStyles.body
                                              .copyWith(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  )),
                        ),
                        Spacer(),
                        if (isPremium)
                          CustomButton(
                              onPressed: () {}, label: "Upgrade to premium")
                      ]),
                ),
                if (controller.myPlan.value == label)
                  Positioned(
                      right: 0,
                      child: SvgPicture.asset(
                        "assets/Vector 2.svg",
                        width: 35,
                        height: 33,
                      )),
                if (controller.myPlan.value == label)
                  Positioned(
                      right: 6,
                      top: 6,
                      child: SvgPicture.asset(
                        "assets/Group.svg",
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGreenShadow extends StatelessWidget {
  const CustomGreenShadow({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // height: 212,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 3, color: Colors.green.shade800),
            ),
            child: child),
        Positioned(
            right: 0,
            child: SvgPicture.asset(
              "assets/Vector 2.svg",
              width: 35,
              height: 33,
            )),
        Positioned(
            right: 6,
            top: 6,
            child: SvgPicture.asset(
              "assets/Group.svg",
            ))
      ],
    );
  }
}
