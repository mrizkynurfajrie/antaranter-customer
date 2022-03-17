import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/api_order_nebeng.dart';
import 'package:intake_customer/response/nebengResponse.dart';
import 'package:intake_customer/routes/app_routes.dart';

class ControllerOrderNebeng extends GetxController {
  final ApiOrderNebeng api;
  ControllerOrderNebeng({required this.api});

  var postinganNebeng = NebengResponse().obs;

  var nama = "nama".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print(Get.arguments.toString());
    postinganNebeng.value = NebengResponse.fromArguments(Get.arguments);
  }

  void orderNebeng() async {
    Get.toNamed(Routes.processOrderNebeng);
    // TODO CALL API ORDER NEBENG
    var idNebeng = postinganNebeng.value.id;
    if (idNebeng != null) {
      await api.orderNebeng(1, idNebeng);
    }
    await Future.delayed(Duration(seconds: 2));
    // IF SUCCESS GO TO PAGE DETAIL ORDER NEBENG
    Get.offNamedUntil(Routes.detailNebeng, ModalRoute.withName(Routes.main));
  }
}
