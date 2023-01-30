import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hajir/app/modules/company_detail/controllers/company_detail_controller.dart';
import 'package:hajir/core/localization/l10n/strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          const SizedBox(
            height: 17,
          ),
          // Container(
          //   height: 200,
          //   width: 200,
          //   child: CustomPaint(painter: ArcPainter(percentage: .5)),
          // ),
          Text(
            strings.employee_list,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            controller.company.value.name ?? "",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 40,
          ),

          Expanded(
            child: Obx(
              () => controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.invitationlist.length,
                      itemBuilder: ((context, index) =>
                          EmployeeWidget(controller: controller, index: index)),
                    ),
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
                const Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.grey,
                ),
                // Image.asset(
                //   "assets/Mask group(1).png",
                //   height: 40,
                //   width: 40,
                // ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        widget.controller.invitationlist[widget.index]
                                ['phone'] ??
                            '',
                        style: const TextStyle(
                          fontSize: 15,
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.controller.invitationlist[widget.index]
                              ['candidatedetails']['code'] ??
                          '',
                      // "RT00${widget.index + 1}",
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () async {
                      launchUrlString(widget
                          .controller.invitationlist[widget.index]['phone']);
                    },
                    icon: SvgPicture.asset("assets/Phone.svg"))
              ]),
              if (isExpanded) ...[
                Row(
                  children: const [
                    // SizedBox(
                    //   width: 64,
                    // ),
                    // Text(
                    //   "Co Founder",
                    //   style:
                    //       TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    // ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          var candidateId = (widget
                              .controller
                              .invitationlist[widget.index]['candidatedetails']
                                  ['id']
                              .toString());
                          if (widget.controller.loading.isFalse) {
                            widget.controller.sendInvitation(candidateId);
                          }
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child:
                                    SvgPicture.asset("assets/Vector(2).svg")),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text("Send Invitation"),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "assets/material-symbols_qr-code-2.svg")),
                      InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          var candidateId = (widget
                              .controller
                              .invitationlist[widget.index]['candidatedetails']
                                  ['id']
                              .toString());
                          widget.controller.removeEmployee(candidateId);
                        },
                        child: Row(
                          children: [
                            const Text("Remove"),
                            const SizedBox(
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
