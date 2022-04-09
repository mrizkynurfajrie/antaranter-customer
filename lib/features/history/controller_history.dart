import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/history/api_history.dart';
import 'package:intake_customer/response/nebeng_order.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';

class ControllerHistory extends GetxController{
  final ApiHistory api;

  ControllerHistory({required this.api});

  ScrollController loadController = ScrollController();

  RxList<NebengOrder> allData = <NebengOrder>[].obs;

  var loading = false.obs;

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  @override
  void onInit() {
    super.onInit();
    history();
  }

  history() async {
    try {
      loading.value = true;
      var runningHistoryApi = await api.historyApiRunning(
          users_id: controllerUserInfo.user.value.id);
      if (runningHistoryApi != null) {
        List<dynamic> response = runningHistoryApi["data"]["data"];
        allData(RxList<NebengOrder>.from(
            response.map((e) => NebengOrder.fromJson(e))));
      }
      loading.value = false;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }

  Future<void> onRefresh()async{
    await Future.delayed(Duration(milliseconds: 1000));
    history();
  }
}
