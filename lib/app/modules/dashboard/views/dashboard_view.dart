import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/modules/dashboard/views/apply_leave.dart';
import 'package:hajir/app/modules/dashboard/views/home.dart';
import 'package:hajir/app/modules/dashboard/views/my_account.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import '../controllers/dashboard_controller.dart';

var tabs = [const Home(), const ApplyLeave(), const MyAccount()];

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    // var tabs = [
    //   const Home(),
    //   const ApplyLeave(),
    //   MyAccount(
    //     controller: controller,
    //   )
    // ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Obx(() => tabs[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (i) {
                if (i == 0) {
                  controller.isCompanySelected(false);
                  controller.companySelected = '';
                  controller.selectedIndex = i;
                } else if (controller.isCompanySelected.isTrue && i == 1) {
                  Get.bottomSheet(
                      const Material(color: Colors.white, child: ApplyLeave()),
                      isScrollControlled: true);
                } else if (controller.companySelected == '' && i == 1) {
                  Get.rawSnackbar(message: "No employment details found.");
                } else {
                  controller.selectedIndex = i;
                }
              },
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex,
              iconSize: 20,
              selectedItemColor: AppColors.primary,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/home.svg",
                      height: 20,
                      width: 19.98,
                      color: AppColors.primary,
                    ),
                    icon: SvgPicture.asset(
                      "assets/home.svg",
                      color: Colors.grey,
                      height: 20,
                      width: 19.98,
                    ),
                    label: strings.home),
                // if (controller.companySelected != '')
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/leave.svg",
                      color: AppColors.primary,
                      height: 20,
                      width: 19.98,
                    ),
                    icon: SvgPicture.asset(
                      "assets/leave.svg",
                      height: 20,
                      width: 19.98,
                    ),
                    label: strings.apply_leave),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/Icon.svg",
                      height: 20,
                      width: 19.98,
                      color: AppColors.primary,
                    ),
                    icon: SvgPicture.asset(
                      "assets/profile.svg",
                      height: 20,
                      width: 19.98,
                      // color: Colors.grey,
                    ),
                    label: strings.my_account),
              ])),
    );
  }
}
