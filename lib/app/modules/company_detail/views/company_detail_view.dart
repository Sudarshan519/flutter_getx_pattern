import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/modules/dashboard/views/my_account.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import '../controllers/company_detail_controller.dart';
import 'pages/attendance.dart';
import 'pages/employee.dart';
import 'pages/home.dart';

class CompanyDetailView extends GetView<CompanyDetailController> {
  const CompanyDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var pages = [
      const EmployerHome(),
      const Attendance(),
      const EmployeeList(),
      MyAccount(
        isEmployer: true,
        controller: controller,
      )
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Obx((() => controller.candidates.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/Group 156.svg",
                          height: 175.65,
                          width: 147.48,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          strings.candidate_not_created,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 19, color: AppColors.primary),
                        ),
                      ),
                    ],
                  )
                : Obx(() => pages[controller.selectedItem.value]))),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        alignment: Alignment.center,
        height: 70,
        child: Obx(
          () =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BottomNavItem(
              onTap: () => Get.back(),
              icon: SvgPicture.asset(
                "assets/Vector(4).svg",
                color: controller.selectedItem.value == 0
                    ? AppColors.primary
                    : Colors.grey,
                height: 24,
              ),
              label: strings.home,
              color: controller.selectedItem.value == 0
                  ? AppColors.primary
                  : Colors.grey,
            ),
            BottomNavItem(
                onTap: () => controller.selectedItem(1),
                color: controller.selectedItem.value == 1
                    ? AppColors.primary
                    : Colors.grey,
                icon: SvgPicture.asset(
                  "assets/Vector(3).svg",
                  color: controller.selectedItem.value == 1
                      ? AppColors.primary
                      : Colors.grey,
                  height: 24,
                ),
                label: strings.attendance),
            FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () async {
                var isAdded = (await Get.toNamed(Routes.ADD_EMPLOYEE) ?? false);
                if (isAdded) {
                  controller.addEmployee();
                }
              },
              child: const Icon(Icons.add),
            ),
            BottomNavItem(
                onTap: () => controller.selectedItem(2),
                color: controller.selectedItem.value == 2
                    ? AppColors.primary
                    : Colors.grey,
                icon: SvgPicture.asset(
                  "assets/Group 132.svg",
                  color: controller.selectedItem.value == 2
                      ? AppColors.primary
                      : Colors.grey,
                  height: 24,
                ),
                label: strings.employee),
            BottomNavItem(
                onTap: () => controller.selectedItem(3),
                color: controller.selectedItem.value == 3
                    ? AppColors.primary
                    : Colors.grey,
                icon: Icon(
                  Icons.settings_outlined,
                  size: 24,
                  color: controller.selectedItem.value == 3
                      ? AppColors.primary
                      : Colors.grey,
                ),
                label: strings.settings)
          ]),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.primary,
      //   onPressed: () {
      //     Get.toNamed(Routes.ADD_EMPLOYEE);
      //   },
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.color,
      required this.label,
      this.onTap,
      this.activeIcon = const SizedBox()});
  final Widget icon;
  final Widget activeIcon;
  final String label;
  final Color color;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            icon,
            const Spacer(),
            Text(
              label,
              style: TextStyle(color: color),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
