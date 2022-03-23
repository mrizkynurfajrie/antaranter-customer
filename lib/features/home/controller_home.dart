import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/home_response.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  var homeResponse = HomeResponse().obs;

  var loading = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      // await Future.delayed(Duration(seconds: 5));
      var res = await api.homeUser(controllerUserInfo.user.value.id ?? 0);
      homeResponse.value = HomeResponse.fromJson(res['data']);
      // print(homeResponse.value.adsResponse?.ads?.length);
      homeResponse.refresh();
      loading.value = false;
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", "Terjadi kesalahan");
    }

    // print(res);
    var user = await Api2().getUser();
  }
}
