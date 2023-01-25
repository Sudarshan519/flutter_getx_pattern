import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/change_number.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/app/modules/mobile_opt/controllers/mobile_opt_controller.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, this.controller});
  final controller;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    //     // appSettings.employer
    //     //     ? Get.find<EmployerDashboardController>()
    //     //     :
    //     Get.isRegistered<DashboardController>()
    //         ? Get.find<DashboardController>()
    //         : Get.find<EmployerDashboardController>();
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: AppBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleWidget(title: strings.profile),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/Avatar Profile.png",
              height: 118,
              width: 118,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              strings.change,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: strings.firstname,
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: strings.lastname,
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(const ChangeNumber(),
                          isScrollControlled: true);
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                          hintText: strings.mobile_number,
                          hintStyle: AppTextStyles.l1,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      try {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030));
                        log(date.toString());
                        if (date == null) {
                          controller.dob = '';
                        } else {
                          controller.dob = date.toString().substring(0, 10);
                        }
                      } catch (e) {
                        controller.dob = '';
                      }
                    },
                    child: Obx(() => TextFormField(
                          controller: TextEditingController()
                            ..text = controller.dob,
                          // initialValue: controller.dob == ''
                          //     ? strings.dob
                          //     : controller.dob,
                          enabled: false,
                          decoration: InputDecoration(
                              hintText: strings.dob,
                              hintStyle: AppTextStyles.l1,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade300)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(onPressed: () {}, label: strings.update),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: CloseButton()),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const Spacer(),
      ],
    );
  }
}

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: child,
    );
  }
}
