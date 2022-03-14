import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/api_order_nebeng.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerOrderNebeng extends GetxController {
  final ApiOrderNebeng api;
  ControllerOrderNebeng({required this.api});
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void orderNebeng() async {
    Get.toNamed(Routes.processOrderNebeng);
    // TODO CALL API ORDER NEBENG
    await Future.delayed(Duration(seconds: 3));
    // IF SUCCESS GO TO PAGE DETAIL ORDER NEBENG
    Get.offNamedUntil(Routes.detailNebeng, ModalRoute.withName(Routes.main));
  }
}
