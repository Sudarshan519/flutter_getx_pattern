import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/views/my_account.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/employer_dashboard_controller.dart';

class Companies extends StatelessWidget {
  const Companies({super.key});

  @override
  Widget build(BuildContext context) {
    final EmployerDashboardController controller = Get.find();
    return WillPopScope(
      onWillPop: (() async {
        var result = await Get.dialog(const ExitDialog());
        return result;
      }),
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getCompanies();
        },
        child: Padding(
          // physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Obx(() => controller.companyList.isNotEmpty
                      ? Text(
                          strings.companies_list,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        )
                      : const SizedBox()),
                  const Spacer(),
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
              const SizedBox(
                height: 20,
              ),
              Obx(() => controller.companyList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: controller.companyList.length,
                        itemBuilder: (_, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              Get.toNamed(Routes.COMPANY_DETAIL,
                                  arguments: controller.companyList[index],
                                  parameters: {
                                    'company_id': controller
                                        .companyList[index].id
                                        .toString(),
                                  });
                            },
                            child: Container(
                              height: 83,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.companyList[index].name!
                                              .capitalize ??
                                          "NA",
                                      style: AppTextStyles.b2.copyWith(
                                          fontSize: 18,
                                          color: AppColors.primary),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${strings.employee} [  ",
                                                  style: AppTextStyles.b2
                                                      .copyWith(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors
                                                              .grey.shade600),
                                                ),
                                                TextSpan(
                                                    text: controller
                                                        .companyList[index]
                                                        .employeeCount
                                                        .toString(),
                                                    style: AppTextStyles.b2
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .primary,
                                                            fontSize: 10)),
                                                const TextSpan(
                                                    text: " ]          "),
                                              ],
                                              style: AppTextStyles.b2.copyWith(
                                                  fontSize: 10,
                                                  color: Colors.grey)),
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                children: [
                                              TextSpan(
                                                  text:
                                                      "${strings.approver} [  "),
                                              TextSpan(
                                                  text: controller
                                                      .companyList[index]
                                                      .approverCount
                                                      .toString(),
                                                  style: AppTextStyles.b2
                                                      .copyWith(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize: 10)),
                                              const TextSpan(text: " ]"),
                                            ],
                                                style: AppTextStyles.b2
                                                    .copyWith(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors
                                                            .grey.shade600))),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        // ),
                      ),
                    )
                  : controller.loading.isTrue
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            SvgPicture.asset(
                              "assets/Group 115(1).svg",
                              height: 160.48,
                              width: 173.85,
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            controller.loadingFailed.isTrue
                                ? InkWell(
                                    onTap: () {
                                      controller.getCompanies();
                                    },
                                    child: const Text("Try again"))
                                : Text(
                                    strings.not_created_company,
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
    );
  }
}

class EmployerDashboardView extends GetView<EmployerDashboardController> {
  const EmployerDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var pages = [
      const Companies(),
      const MyAccount(
        isEmployer: true,
      )
    ];

    return Scaffold(
      body: SafeArea(child: Obx(() => pages[controller.selectedIndex.value])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: AppColors.primary,
            currentIndex: controller.selectedIndex.value,
            selectedLabelStyle: const TextStyle(
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
          Get.toNamed(
            Routes.CREATE_COMPANY,
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
