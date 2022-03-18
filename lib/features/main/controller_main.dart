import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/page_detail_nebeng.dart';
import 'package:intake_customer/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  var currentPage = 0.obs;
  final List<Widget> pages = [
    PageHome(),
    PageDetailNebeng(),
    PageProfile(),
  ];
  void changePage(index) => currentPage.value = index;
}
