import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/change_number.dart';
import 'package:hajir/app/modules/employer_dashboard/controllers/employer_dashboard_controller.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/app_settings/shared_pref.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController fname;
    TextEditingController email;
    TextEditingController mobile;

    if (appSettings.employer) {
      EmployerDashboardController employerDashboardController;
      employerDashboardController = Get.find();
      fname = TextEditingController()
        ..text = employerDashboardController.user.value.name ?? '';

      email = TextEditingController()
        ..text = employerDashboardController.user.value.email ?? '';
      mobile = TextEditingController(
          text: employerDashboardController.user.value.phone);
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: AppBottomSheet(
            child: Form(
              key: formKey,
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
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fname,
                          decoration: InputDecoration(
                              labelText: strings.firstname,
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
                          controller: email,
                          validator: (v) {
                            if (GetUtils.isEmail(v!)) {
                              return null;
                            } else if (v.isEmpty) {
                              return '* Email required';
                            } else {
                              return 'Enter a valid email.';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'E-mail',
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
                            // Get.bottomSheet(const ChangeNumber(),
                            //     isScrollControlled: true);
                          },
                          child: TextFormField(
                            enabled: false,
                            controller: mobile,
                            decoration: InputDecoration(
                                hintText: strings.mobile_number,
                                hintStyle: AppTextStyles.l1,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
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
                                  initialDate: DateTime(2020),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2030));

                              if (appSettings.employer) {
                                employerDashboardController.dob = '';
                                if (date == null) {
                                } else {
                                  employerDashboardController.dob =
                                      date.toString().substring(0, 10);
                                }
                              } else {}
                            } catch (e) {
                              employerDashboardController.dob = '';
                            }
                          },
                          child: Obx(() => TextFormField(
                                controller: TextEditingController()
                                  ..text = employerDashboardController.dob,
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: strings.dob,
                                    hintStyle: AppTextStyles.l1,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300)),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (employerDashboardController.dob.isEmpty) {
                                  Get.rawSnackbar(
                                      message: 'Date of birth requried.');
                                } else {
                                  if (appSettings.employer) {
                                    employerDashboardController.updateProfile(
                                      fname.text,
                                      email.text,
                                      mobile.text,
                                    );
                                  } else {}
                                }
                              }
                            },
                            label: strings.update),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      DashboardController dashboardController;
      dashboardController = Get.find();
      fname = TextEditingController()
        ..text = dashboardController.user.value.name ?? '';

      email = TextEditingController()
        ..text = dashboardController.user.value.email ?? '';
      mobile =
          TextEditingController(text: dashboardController.user.value.phone);
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 16),
          child: AppBottomSheet(
            child: Form(
              key: formKey,
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
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: fname,
                          decoration: InputDecoration(
                              labelText: strings.firstname,
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
                          controller: email,
                          validator: (v) {
                            if (GetUtils.isEmail(v!)) {
                              return null;
                            } else if (v.isEmpty) {
                              return '* Email required';
                            } else {
                              return 'Enter a valid email.';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'E-mail',
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
                            controller: mobile,
                            decoration: InputDecoration(
                                hintText: strings.mobile_number,
                                hintStyle: AppTextStyles.l1,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade300)),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
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

                              if (date == null) {
                                dashboardController.dob = '';
                              } else {
                                dashboardController.dob =
                                    date.toString().substring(0, 10);
                              }
                            } catch (e) {
                              dashboardController.dob = '';
                            }
                          },
                          child: Obx(() => TextFormField(
                                controller: TextEditingController()
                                  ..text = dashboardController.dob,
                                enabled: false,
                                decoration: InputDecoration(
                                    hintText: strings.dob,
                                    hintStyle: AppTextStyles.l1,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade300)),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (dashboardController.dob.isEmpty) {
                                  Get.rawSnackbar(
                                      message: 'Date of birth requried.');
                                } else {
                                  if (appSettings.employer) {
                                  } else {
                                    dashboardController.updateProfile(
                                      fname.text,
                                      email.text,
                                      mobile.text,
                                    );
                                  }
                                }
                              }
                            },
                            label: strings.update),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
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
          textAlign: TextAlign.center,
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
      margin: const EdgeInsets.only(top: 18),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: child,
    );
  }
}
