import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/employer_dashboard_controller.dart';

class EmployerDashboardView extends GetView<EmployerDashboardController> {
  const EmployerDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Obx(() => controller.companyList.isNotEmpty
                      ? Text(
                          "Companies list",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        )
                      : SizedBox()),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        "assets/notification.svg",
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => controller.companyList.isNotEmpty
                  ? Column(
                      children: List.generate(
                        controller.companyList.length,
                        (index) => InkWell(
                          onTap: () {
                            Get.toNamed(Routes.COMPANY_DETAIL,
                                arguments: controller.companyList[index]);
                          },
                          child: Container(
                            height: 83,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            margin: const EdgeInsets.only(bottom: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.companyList[index].name ?? "NA",
                                    style: AppTextStyles.b2.copyWith(
                                        fontSize: 18, color: AppColors.primary),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            children: [
                                              TextSpan(text: "EMPLOYEE [  "),
                                              TextSpan(
                                                  text: "24",
                                                  style: AppTextStyles.b2
                                                      .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 10)),
                                              TextSpan(text: " ]          "),
                                            ],
                                            style: AppTextStyles.b2.copyWith(
                                                fontSize: 10,
                                                color: Colors.grey)),
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              children: [
                                            TextSpan(text: "APPROVER [  "),
                                            TextSpan(
                                                text: "24",
                                                style: AppTextStyles.b2
                                                    .copyWith(
                                                        color:
                                                            AppColors.primary,
                                                        fontSize: 10)),
                                            TextSpan(text: " ]"),
                                          ],
                                              style: AppTextStyles.b2.copyWith(
                                                  fontSize: 10,
                                                  color: Colors.grey))),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        SvgPicture.asset(
                          "assets/Group 115(1).svg",
                          height: 160.48,
                          width: 173.85,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          """You’ve not created
        company yet.""",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            currentIndex: controller.selectedIndex.value,
            selectedLabelStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
            onTap: (i) {
              controller.selectedIndex(i);
            },
            items: [
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/home.svg",
                    height: 24,
                    width: 24,
                    color: AppColors.primary,
                  ),
                  icon: SvgPicture.asset(
                    "assets/home.svg",
                    color: Colors.grey,
                    height: 24,
                    width: 24,
                  ),
                  label: strings.home),
              BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    "assets/Icon.svg",
                    height: 24,
                    width: 24,
                    color: AppColors.primary,
                  ),
                  icon: SvgPicture.asset(
                    "assets/profile.svg",
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                  label: strings.my_account),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.toNamed(Routes.CREATE_COMPANY);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
