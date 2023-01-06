import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/config/app_text_styles.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/core/localization/l10n/strings.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyDetailController controller = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 17,
          ),
          // Container(
          //   height: 200,
          //   width: 200,
          //   child: CustomPaint(painter: ArcPainter(percentage: .5)),
          // ),
          Text(
            strings.employee_list,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            controller.company.value.name ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.candidates.length,
              itemBuilder: ((context, index) =>
                  EmployeeWidget(controller: controller, index: index)),
            ),
          ),
        ],
      ),
    );
  }
}

class EmployeeWidget extends StatefulWidget {
  const EmployeeWidget(
      {Key? key, required this.controller, required this.index})
      : super(key: key);

  final CompanyDetailController controller;
  final int index;

  @override
  State<EmployeeWidget> createState() => _EmployeeWidgetState();
}

class _EmployeeWidgetState extends State<EmployeeWidget> {
  var isExpanded = false;
  changeCardState() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          changeCardState();
        },
        child: Container(
          height: isExpanded ? 142 : 70,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300)),
          // margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image.asset(
                  "assets/Mask group(1).png",
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.controller.candidates[widget.index].name!,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "RT00${widget.index + 1}",
                      style: TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/Phone.svg"))
              ]),
              if (isExpanded) ...[
                Row(
                  children: [
                    SizedBox(
                      width: 64,
                    ),
                    Text(
                      "Co Founder",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child:
                                    SvgPicture.asset("assets/Vector(2).svg")),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Send Invitation"),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "assets/material-symbols_qr-code-2.svg")),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text("Remove"),
                            SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child:
                                    SvgPicture.asset("assets/Vector(5).svg")),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
