import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

import '../controllers/candidatecompanies_controller.dart';

class CandidatecompaniesView extends GetView<CandidatecompaniesController> {
  const CandidatecompaniesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    // (controller.getCompanies());
    return ListView(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            strings.companies_list,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ),
        Obx(
          () => controller.loading.isTrue
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: controller.candidateCompanies
                      .map(
                        (e) => RPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              dashboardController.companySelected =
                                  (e['id'].toString());
                              appSettings.companyId = e['id'].toString();
                              // Get.toNamed(Routes.COMPANY_DETAIL,
                              //     arguments: controller.companyList[index],
                              //     parameters: {
                              //       'company_id': controller.companyList[index].id.toString()
                              //     });
                            },
                            child: Container(
                              height: 83,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              // margin: const EdgeInsets.only(bottom: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['name'].toString().capitalizeFirst ??
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
                                        // RichText(
                                        //   text: TextSpan(
                                        //       children: [
                                        //         TextSpan(
                                        //           text: "${strings.employee} [  ",
                                        //           style: AppTextStyles.b2.copyWith(
                                        //               fontSize: 10,
                                        //               fontWeight: FontWeight.w500,
                                        //               color: Colors.grey.shade600),
                                        //         ),
                                        //         TextSpan(
                                        //             text: "x",
                                        //             style: AppTextStyles.b2.copyWith(
                                        //                 fontWeight: FontWeight.w600,
                                        //                 color: AppColors.primary,
                                        //                 fontSize: 10)),
                                        //         const TextSpan(text: " ]          "),
                                        //       ],
                                        //       style: AppTextStyles.b2
                                        //           .copyWith(fontSize: 10, color: Colors.grey)),
                                        // ),
                                        RichText(
                                            text: TextSpan(
                                                children: [
                                              const TextSpan(
                                                  text: "OfficeTime [  "),
                                              TextSpan(
                                                  text: "09:00 AM - 04:00 PM",
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
                      )
                      .toList()),
        )
      ],
    );
  }
}
