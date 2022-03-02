import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/home/api_home.dart';
import 'package:intake_customer/framework/api2.dart';

class ControllerHome extends GetxController {
  final ApiHome api;
  ControllerHome({required this.api});

  late TextEditingController searchController;

  final username = ''.obs;
  final image = ''.obs;
  final phone = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    searchController = TextEditingController();
    setUser();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  void setUser() async {
    var user = await Api2().getUser();
    username.value = user['username'] ?? "Pelanggan";
    image.value = user['image'] ?? "";
    phone.value = user['phone'] ?? "08xxxxxxxxxx";
  }
}
