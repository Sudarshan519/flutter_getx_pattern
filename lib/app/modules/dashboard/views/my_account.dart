import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "My Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
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
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nitesh Shrestha",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "niteshoncode@gmail.com",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              tileColor: Color.fromRGBO(67, 118, 254, 0.05),
              title: Text(
                "Profile",
                style: AppTextStyles.normal,
              ),
            ),
            ListTile(
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
      ),
    );
  }
}
