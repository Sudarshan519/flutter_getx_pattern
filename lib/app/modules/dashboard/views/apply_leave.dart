import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CloseButton(),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "Apply For Leave",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  hintText: "Leave Type",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              items: List.generate(
                  3,
                  (index) => DropdownMenuItem(
                        value: index,
                        child: Text(index.toString()),
                      )),
              onChanged: (Object? value) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Leave Type",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Duration",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              enabled: false,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: "Upload Image",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "Remarks",
                  hintStyle: AppTextStyles.l1,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
                onPressed: () {
                  Get.back();
                  Get.bottomSheet(
                      Material(color: Colors.white, child: ApplySuccess()),
                      isScrollControlled: true);
                },
                label: "Submit"),
            SizedBox(
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
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CloseButton(),
            SizedBox(
              width: 16,
            ),
            Text(
              "Apply For Leave",
              style: Theme.of(context).textTheme.headline6,
            ),
            Spacer()
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          """Successfully 
      sent your request.""",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          """We’ve received your request. 
      We will get back to you""",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
        SizedBox(
          height: 40,
        ),
        CustomButton(
            onPressed: () {
              Get.back();
            },
            label: "Close"),
        SizedBox(
          height: 20,
        ),
      ]),
    ));
  }
}
