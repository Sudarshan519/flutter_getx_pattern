import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CloseButton(),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  strings.apply_for_leave,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              isDense: true,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintText: strings.leave_type,
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              items: List.generate(
                  3,
                  (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString()),
                      )),
              onChanged: (Object? value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintText: strings.leave_type,
                  hintStyle: AppTextStyles.l1.copyWith(fontWeight: FontWeight.normal),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: strings.duration,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              enabled: false,
              maxLines: 3,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: strings.upload_image,
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: strings.remarks,
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                onPressed: () {
                  Get.back();
                  Get.bottomSheet(
                      const Material(color: Colors.white, child: ApplySuccess()),
                      isScrollControlled: true);
                },
                label: "Submit"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ApplySuccess extends StatelessWidget {
  const ApplySuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CloseButton(),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Apply For Leave",
              style: Theme.of(context).textTheme.headline6,
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          """Successfully 
      sent your request.""",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          """We’ve received your request. 
      We will get back to you""",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
            onPressed: () {
              Get.back();
            },
            label: "Close"),
        const SizedBox(
          height: 20,
        ),
      ]),
    ));
  }
}
