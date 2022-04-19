import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/main/controller_main.dart';
import 'package:intake_customer/shared/widgets/buttons/custom_bottom_navbar.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';

class PageMain extends GetView<ControllerMain> {
  PageMain({Key? key}) : super(key: key);

  DateTime preBackpress = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // get to page home first before exit
          if (controller.currentPage.value != 0) {
            controller.changePage(0);
            controller.pageController.jumpToPage(0);
            return false;
          }
          // double click exit with 2 seconds
          const maxDuration = Duration(seconds: 2);
          final timegap = DateTime.now().difference(preBackpress);
          // check if timegap duration is greater then 2 seconds
          final cantExit = timegap >= maxDuration;
          // init preback again
          preBackpress = DateTime.now();
          if (cantExit) {
            //show snackbar
            showToast(
              message: "Tekan sekali lagi untuk keluar",
              color: Colors.black.withOpacity(0.6),
            );
            return false;
          } else {
            return true;
          }
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (pageIndex) {
            controller.changePage(pageIndex);
          },
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          selectedIndex: controller.currentPage.value,
          onTap: (pageIndex) {
            controller.changePage(pageIndex);
            controller.pageController.jumpToPage(pageIndex);
          },
        ),
      ),
    );
  }
}
