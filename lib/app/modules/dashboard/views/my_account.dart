import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/add_approver.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/monthly_report.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/my_plans.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/change_language.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';
import 'package:hajir/app/modules/employer_dashboard/controllers/employer_dashboard_controller.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({
    super.key,
    this.isEmployer = false,
  });
  final bool isEmployer;

  @override
  Widget build(BuildContext context) {
    if (appSettings.employer) {
      final EmployerDashboardController controller = Get.find();
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  strings.my_account,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              // const SizedBox(
              //   height: 12,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    // !controller.isEmployed
                    //     ? const CircleAvatar(
                    //         radius: 32, child: Icon(Icons.person))
                    //     :
                    // Image.asset(
                    //   "assets/Avatar Profile.png",
                    //   height: 64,
                    //   width: 64,
                    // ),
                    const Icon(
                      CupertinoIcons.person_circle,
                      size: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            // !controller.isEmployed &&
                            controller.isEmployed && appSettings.employer
                                ? "+977 ${controller.user.value.phone}"
                                : controller.user.value.name == ""
                                    ? "NA"
                                    : controller.user.value.name.toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.isEmployed
                              ? controller.user.value.email!
                              : "name@company.com",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              ListTile(
                onTap: () {
                  Get.bottomSheet(const Profile(), isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                // tileColor: Color.fromRGBO(67, 118, 254, 0.05),
                title: Text(
                  strings.profile,
                  style: AppTextStyles.normal,
                ),
              ),
              if (!isEmployer)
                if (controller.isEmployed)
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(const Reports(),
                          isScrollControlled: true);
                    },
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    title: Text(
                      strings.reports,
                      style: AppTextStyles.normal,
                    ),
                  )
                else
                  const SizedBox()
              else ...[
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.INBOX);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.inbox,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const MonthlyReports(),
                        isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.monthly_reports,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const AddApprover(),
                        isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.add_approver,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const MyPlans(), isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.my_plans,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.ENROLL_ATTENDEE);
                    // Get.bottomSheet(const AddApprover(),
                    //     isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.enroll_attendee,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.MISSING_ATTENDANCE);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.missing_attendance,
                    style: AppTextStyles.normal,
                  ),
                ),
              ],
              ListTile(
                onTap: () {
                  // Get.bottomSheet(const AddApprover(), isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.settings,
                  style: AppTextStyles.normal,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.bottomSheet(const ChangeLanguage(),
                      isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.change_language,
                  style: AppTextStyles.normal,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.dialog(LogoutDialog(controller: controller));
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.logout,
                  style: AppTextStyles.normal,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    } else {
      final DashboardController controller = Get.find();
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  strings.my_account,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    // !controller.isEmployed
                    //     ? const CircleAvatar(
                    //         radius: 32, child: Icon(Icons.person))
                    //     :
                    // Image.asset(
                    //   "assets/Avatar Profile.png",
                    //   height: 64,
                    //   width: 64,
                    // ),
                    const Icon(
                      CupertinoIcons.person_circle,
                      size: 50,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            // !controller.isEmployed &&
                            controller.isEmployed
                                ? controller.user.value.name == ""
                                    ? "NA"
                                    : controller.user.value.name.toString()
                                : "+977 ${controller.user.value.phone}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          controller.isEmployed
                              ? controller.user.value.email!
                              : "name@company.com",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              ListTile(
                onTap: () {
                  Get.bottomSheet(const Profile(), isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                // tileColor: Color.fromRGBO(67, 118, 254, 0.05),
                title: Text(
                  strings.profile,
                  style: AppTextStyles.normal,
                ),
              ),
              if (!isEmployer)
                if (controller.isEmployed)
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(const Reports(),
                          isScrollControlled: true);
                    },
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    title: Text(
                      strings.reports,
                      style: AppTextStyles.normal,
                    ),
                  )
                else
                  const SizedBox()
              else ...[
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.INBOX);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.inbox,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const MonthlyReports(),
                        isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.monthly_reports,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const AddApprover(),
                        isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.add_approver,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.bottomSheet(const MyPlans(), isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.my_plans,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.ENROLL_ATTENDEE);
                    // Get.bottomSheet(const AddApprover(),
                    //     isScrollControlled: true);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.enroll_attendee,
                    style: AppTextStyles.normal,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(Routes.MISSING_ATTENDANCE);
                  },
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                  title: Text(
                    strings.missing_attendance,
                    style: AppTextStyles.normal,
                  ),
                ),
              ],
              ListTile(
                onTap: () {
                  // Get.bottomSheet(const AddApprover(), isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.settings,
                  style: AppTextStyles.normal,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.bottomSheet(const ChangeLanguage(),
                      isScrollControlled: true);
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.change_language,
                  style: AppTextStyles.normal,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.dialog(LogoutDialog(controller: controller));
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                title: Text(
                  strings.logout,
                  style: AppTextStyles.normal,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
    }
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key, required this.controller}) : super(key: key);
  final controller;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          strings.logout_dialog,
          style: AppTextStyles.b1,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 320.w,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                    color: Colors.grey,
                    onPressed: () => Get.back(),
                    label: strings.cancel),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                    color: Colors.red.shade700,
                    onPressed: () => logout(controller),
                    label: strings.logout),
              ),
            ],
          ),
        )
      ]),
    );
  }

  logout(controller) {
    controller.logout();
    // if (appSettings.type == 'candidate') {
    //   Get.find<DashboardController>().logout();
    // } else {
    //   Get.find<EmployerDashboardController>().logout();
    //   // Get.offAllNamed(Routes.WELCOME);
    // }
  }
}

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          "Are you sure you want to quit app ? ",
          style: AppTextStyles.b1,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 320.w,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                    color: Colors.grey,
                    onPressed: () => Get.back(result: false),
                    label: strings.cancel),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomButton(
                    color: Colors.red.shade700,
                    onPressed: () => Get.back(result: true),
                    label: 'Exit'),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
