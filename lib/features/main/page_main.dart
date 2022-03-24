import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/main/controller_main.dart';
import 'package:intake_customer/shared/widgets/buttons/custom_bottom_navbar.dart';

class PageMain extends GetView<ControllerMain> {
  const PageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (pageIndex) {
          controller.changePage(pageIndex);
        },
        children: controller.pages,
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
