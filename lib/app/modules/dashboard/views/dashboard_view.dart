import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/modules/dashboard/views/apply_leave.dart';
import 'package:hajir/app/modules/dashboard/views/home.dart';
import 'package:hajir/app/modules/dashboard/views/my_account.dart';
import '../controllers/dashboard_controller.dart';

var tabs = [Home(), ApplyLeave(), MyAccount()];

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/notification.svg",
                        height: 24,
                        width: 24,
                      ),
                      Positioned(
                        top: 3,
                        right: 0,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Obx(() => tabs[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              onTap: (i) => controller.selectedIndex = i,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex,
              selectedItemColor: AppColors.primary,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/home.svg",
                      color: AppColors.primary,
                    ),
                    icon: SvgPicture.asset(
                      "assets/home.svg",
                      color: Colors.grey,
                    ),
                    label: "Home"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/leave.svg",
                      height: 20,
                      width: 19.98,
                      color: AppColors.primary,
                    ),
                    icon: SvgPicture.asset(
                      "assets/leave.svg",
                      height: 20,
                      width: 19.98,
                    ),
                    label: "Apply Leave"),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      "assets/profile.svg",
                      color: AppColors.primary,
                    ),
                    icon: SvgPicture.asset(
                      "assets/profile.svg",
                      // color: Colors.grey,
                    ),
                    label: "My Account"),
              ])),
    );
  }
}
