import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/employer_dashboard/models/company.dart';
import 'package:hajir/app/routes/app_pages.dart';

import '../controllers/company_detail_controller.dart';

class CompanyDetailView extends GetView<CompanyDetailController> {
  const CompanyDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CompanyModel company = Get.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 17,
              ),
              Text(
                company.name ?? "",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              SizedBox(
                height: 165,
              ),
              Obx((() => controller.candidates.isEmpty
                  ? Column(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/Group 156.svg",
                            height: 175.65,
                            width: 147.48,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Text(
                            """You’ve not created 
candidate.""",
                            style: TextStyle(
                                fontSize: 19, color: AppColors.primary),
                          ),
                        ),
                      ],
                    )
                  : SizedBox())),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
        alignment: Alignment.center,
        height: 70,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          BottomNavItem(
              icon: SvgPicture.asset(
                "assets/Vector(4).svg",
                color: Colors.grey,
                height: 24,
              ),
              label: "Home"),
          BottomNavItem(
              icon: SvgPicture.asset(
                "assets/Vector(3).svg",
                height: 24,
              ),
              label: "Attendance"),
          BottomNavItem(
              icon: SvgPicture.asset(
                "assets/Group 132.svg",
                height: 24,
              ),
              label: "Employee"),
          BottomNavItem(
              icon: Icon(
                Icons.settings_outlined,
                size: 24,
                color: Colors.grey,
              ),
              label: "Settings")
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.toNamed(Routes.ADD_EMPLOYEE);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.label,
      this.activeIcon = const SizedBox()});
  final Widget icon;
  final Widget activeIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        icon,
        Spacer(),
        Text(label),
        Spacer(),
      ],
    );
  }
}
