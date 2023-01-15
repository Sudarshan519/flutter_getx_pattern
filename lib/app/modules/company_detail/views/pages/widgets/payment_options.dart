import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/views/pages/widgets/my_plans.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

var paymentOptions = [
  "eSewa",
  "PhonePay",
  "Bank Transfer",
  "Credit/ Debit Card(International)",
  "Paypal"
];

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: AppBottomSheet(
            child: Column(children: [
          TitleWidget(title: strings.payment_options),
          SizedBox(
            height: 20,
          ),
          ...paymentOptions.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                child: Container(
                  height: 58.h,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8)),
                  child: paymentOptions.indexOf(e) == 0
                      ? CustomGreenShadow(
                          child: Text(e),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(e),
                        ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
                onPressed: () {
                  Get.back();
                  Get.dialog(AlertDialog(
                    content: AlertSuccess(),
                  ));
                },
                label: strings.pay_now),
          )
        ])));
  }
}

class AlertSuccess extends StatelessWidget {
  const AlertSuccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 36),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: Colors.grey.shade200,
          child: SvgPicture.asset(
            "assets/Group.svg",
            color: Colors.green,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          strings.successful_payment,
          style: AppTextStyles.b2.copyWith(color: Colors.green),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          strings.thank_for_purchanse,
          style: AppTextStyles.medium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        CustomButton(
            onPressed: () {
              Get.back();
            },
            label: strings.done)
      ]),
    );
  }
}