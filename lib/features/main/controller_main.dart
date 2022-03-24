import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/page_detail_nebeng.dart';
import 'package:intake_customer/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  late PageController pageController;
  var currentPage = 0.obs;
  final List<Widget> pages = [
    const PageHome(),
    const PageDetailNebeng(),
    const PageProfile(),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage.value);
  }

  @override
  void onReady() {
    super.onReady();
    var pageArg = Get.arguments;
    if (pageArg != null) {
      changePage(pageArg);
      pageController.jumpToPage(pageArg);
    }
  }

  void changePage(index) => currentPage.value = index;
}
