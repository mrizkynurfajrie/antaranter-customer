import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/main/controller_main.dart';

class PageMain extends GetView<ControllerMain> {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => controller.pages.elementAt(
              controller.currentPage.value,
            )),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Color(0xFFFF9147),
          currentIndex: controller.currentPage.value,
          onTap: (index) => controller.changePage(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pedal_bike),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
