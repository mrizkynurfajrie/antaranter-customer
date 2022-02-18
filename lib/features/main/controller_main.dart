import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/create_order/page_create_order.dart';
import 'package:intake_customer/features/home/page_home.dart';
import 'package:intake_customer/features/profile/page_profile.dart';

class ControllerMain extends GetxController {
  var currentPage = 0.obs;
final List<Widget> pages = [
    PageHome(),
    PageCreateOrder(),
    PageProfile(),
  ];
  void changePage(index) => currentPage.value = index;
}
