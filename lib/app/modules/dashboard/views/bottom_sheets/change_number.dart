import 'package:flutter/cupertino.dart';
import 'package:hajir/app/modules/add_employee/views/add_employee_view.dart';
import 'package:hajir/app/modules/dashboard/views/bottom_sheets/profile.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TitleWidget(title: strings.settings),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                CustomFormField(
                  hint: strings.current_number,
                  title: strings.change_number,
                ),
                CustomFormField(
                  hint: strings.changed_number,
                ),
                CustomFormField(
                  hint: strings.confirm_changed_number,
                ),
                CustomButton(onPressed: () {}, label: strings.update),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
