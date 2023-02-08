import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
        ),
        body: Obx(
          () => controller.loading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.getNotifications();
                  },
                  child: ListView.builder(
                      itemCount: controller.notifications.length,
                      itemBuilder: (_, i) => ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 18),
                            // subtitle:
                            //     Text(controller.notifications[i].toString()),
                            title: Text(controller.notifications[i].toString()),
                          )),
                ),
        ));
  }
}
