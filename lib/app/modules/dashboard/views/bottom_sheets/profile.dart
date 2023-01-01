import 'package:flutter/material.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/language/views/language_view.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleWidget(title: "Profile"),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/Avatar Profile.png",
            height: 118,
            width: 118,
          ),
          SizedBox(
            height: 16,
          ),
          const Text(
            "Change",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "First name",
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
                      hintText: "Last name",
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
                      hintText: "Mobile number",
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
                InkWell(
                  onTap: () {
                    var date = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030));
                  },
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                        hintText: "Date of birth",
                        hintStyle: AppTextStyles.l1,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade400)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(onPressed: () {}, label: "Update"),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: CloseButton()),
        Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Spacer(),
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
