import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/api_detail_nebeng.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/nebeng_order_response.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerDetailNebeng extends GetxController
    with StateMixin<NebengOrderResponse> {
  final ApiDetailNebeng api;
  ControllerDetailNebeng({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();
  var orderResponse = NebengOrderResponse().obs;

  var loadingCancel = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getDataOrder();
  }

  void getDetailOrder(int id) async {
    change(null, status: RxStatus.loading());
    try {
      var res = await api.detailNebengOrder(id);
      orderResponse.value = NebengOrderResponse.fromJson(res['data']);
      change(orderResponse.value, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error());
    }
  }

  openwhatsapp() async {
    log(orderResponse.value.mainRider!.phone!.toString());
    var editedPhone =
        orderResponse.value.mainRider?.phone?.replaceFirst(RegExp(r'^0+'), "");
    var whatsapp = "+62$editedPhone";
    var whatsappURlAndroid =
        "https://wa.me/$whatsapp?text=${Uri.parse("halo driver saya telah memesan nebeng anda")}";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed");
      }
    } else {
      // android , web

      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed android");
      }
    }
  }

  getDataOrder() async {
    // CHECK DULU APAKAH ADA DATA DI CACHE
    controllerUserInfo.checkUserHasActiveOrder();
    if (controllerUserInfo.hasActiveOrder.value) {
      var dataOrder = await Api2().getActiveOrder();
      return getDetailOrder(dataOrder['id']);
    }
    // TODO GET DATA ORDER BY ID
    getDetailOrderByUser();
  }

  void getDetailOrderByUser() async {
    change(null, status: RxStatus.loading());
    try {
      var userId = controllerUserInfo.user.value.id;
      print(userId);
      if (userId != null) {
        var res = await api.detailNebengOrderByUserId(userId);
        log(res.toString());
        if (res['success'] == true) {
          try {
            orderResponse.value = NebengOrderResponse.fromJson(res['data']);
            controllerUserInfo.setActiveOrder(
              orderResponse.value.nebengOrder?.id ?? 0,
              "nebeng",
            );
            controllerUserInfo.setUserHasActiveOrder(true);
            change(orderResponse.value, status: RxStatus.success());
          } catch (e) {
            change(null, status: RxStatus.empty());
          }
        } else {
          throw "Terjadi kesalahan";
        }
      } else {
        throw "error user not found";
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void cancelOrderNebeng() async {
    try {
      var result = await Get.defaultDialog(
        title: "Konfirmasi",
        middleText: "Anda yakin ingin membatalkan pesanan ?",
        textCancel: "Tidak",
        textConfirm: "Iya",
        cancelTextColor: AppColor.primaryColor,
        confirmTextColor: Colors.white,
        buttonColor: AppColor.primaryColor,
        onConfirm: () {
          Get.back(result: true);
        },
      );
      loadingCancel.value = true;
      if (result == true) {
        var res = await api.cancelNebengOrder(
          orderResponse.value.nebengOrder?.id ?? 0,
        );
        log(res.toString());
        if (res['success'] == true) {
          controllerUserInfo.removeActiveOrder();
          controllerUserInfo.setUserHasActiveOrder(false);
          change(null, status: RxStatus.empty());
        } else {
          throw "Terjadi kesalahan";
        }
      }
      loadingCancel.value = false;
    } catch (e) {
      print(e.toString());
      loadingCancel.value = false;
      Get.snackbar("Kesalahan", e.toString());
    }
  }
}
