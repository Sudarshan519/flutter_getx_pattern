import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/routes/app_pages.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleWidget(title: "Change Language"),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomButton(
                    onPressed: () {
                      appSettings.changeLang();
                      Get.back();
                    },
                    label: "ENGLISH"),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Or",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                    onPressed: () {
                      appSettings.changeLang(en: false);
                      Get.back();
                    },
                    label: "Nepali",
                    color: AppColors.red),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
