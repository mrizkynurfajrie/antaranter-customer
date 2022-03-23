import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/api_order_nebeng.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/nebengResponse.dart';
import 'package:intake_customer/response/nebeng_order_response.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

class ControllerOrderNebeng extends GetxController {
  var controllerUserInfo = Get.find<ControllerUserInfo>();

  final ApiOrderNebeng api;
  ControllerOrderNebeng({required this.api});

  var postinganNebeng = NebengResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // print(Get.arguments.toString());
    postinganNebeng.value = NebengResponse.fromArguments(Get.arguments);
  }

  void orderNebeng() async {
    var userAuth = await Api2().getUser();
    Get.toNamed(Routes.processOrderNebeng);
    // TODO CALL API ORDER NEBENG
    var idNebeng = postinganNebeng.value.id;
    if (idNebeng != null) {
      try {
        var res = await api.orderNebeng(userAuth['id'], idNebeng);
        // print(res.toString());
        // TODO status activity set true save response
        if (res['success'] == true) {
          controllerUserInfo.setUserHasActiveOrder(true);
          var orderNebengRes = NebengOrderResponse.fromJson(res['data']);
          controllerUserInfo.setActiveOrder(
            orderNebengRes.nebengOrder?.id ?? 0,
            "nebeng",
          );
        }
      } catch (e) {
        // TODO HANDLE ERROR
        print(e.toString());
      }
    }
    await Future.delayed(Duration(seconds: 2));
    // IF SUCCESS GO TO PAGE DETAIL ORDER NEBENG
    Get.offAllNamed(Routes.main, arguments: 1);
  }
}
