import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_colors.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/routes/app_pages.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool isInvited = true;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: double.infinity,
            height: isInvited ? (9) : 125,
          ),
          if (isInvited)
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 63,
                    width: 228.67,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.92),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                        ]),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "You have removed from the ",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: "Rasan Technologies ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: "company.",
                          style: Theme.of(context).textTheme.bodyMedium)
                    ])),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
              ],
            ),
          SizedBox(
              height: 160.48 + 26.52,
              width: 173.85,
              child: Stack(
                children: [
                  Positioned(
                    top: 17,
                    child: Image.asset(
                      "assets/Group 89.png",
                      height: 170,
                      width: 170,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/Group 115(1).svg",
                    height: 160.48,
                    width: 173.85,
                  ),
                ],
              )),
          if (isInvited) ...[
            const SizedBox(height: 36),
            Container(
                height: 167,
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.92),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300, blurRadius: 1)
                    ]),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Rasan Technologies",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.w700)),
                        TextSpan(text: """ is invited
to join a company""", style: Theme.of(context).textTheme.titleSmall)
                      ]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 32,
                          width: 113,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24))),
                              onPressed: () {
                                Get.toNamed(Routes.CANDIDATE_LOGIN);
                              },
                              child: Text("Accept")),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        SizedBox(
                          height: 32,
                          width: 113,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: AppColors.red,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24))),
                              onPressed: () {},
                              child: Text(
                                "Decline",
                                style: AppTextStyles.b2,
                              )),
                        ),
                      ],
                    )
                  ],
                ))
          ] else ...[
            SizedBox(
              height: 76,
            ),
            Text(
              """You’ve not invited to
      company yet.""",
              style: Theme.of(context).textTheme.headline6,
            ),
          ]
        ],
      ),
    );
  }
}