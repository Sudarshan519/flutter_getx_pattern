import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/change_language.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/reports.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "My Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Image.asset(
                  "assets/Avatar Profile.png",
                  height: 64,
                  width: 64,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Nitesh Shrestha",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "niteshoncode@gmail.com",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
              "Profile",
              style: AppTextStyles.normal,
            ),
          ),
          ListTile(
            onTap: () {
              Get.bottomSheet(const Reports(), isScrollControlled: true);
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: Text(
              "Reports",
              style: AppTextStyles.normal,
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: Text(
              "Settings",
              style: AppTextStyles.normal,
            ),
          ),
          ListTile(
            onTap: () {
              Get.bottomSheet(const ChangeLanguage(), isScrollControlled: true);
            },
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: Text(
              "Change language",
              style: AppTextStyles.normal,
            ),
          ),
          ListTile(
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
            title: Text(
              "Log out",
              style: AppTextStyles.normal.copyWith(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }
}
