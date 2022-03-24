import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/api_detail_nebeng.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/nebeng_order_response.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerDetailNebeng extends GetxController
    with StateMixin<NebengOrderResponse> {
  final ApiDetailNebeng api;
  ControllerDetailNebeng({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();
  var orderResponse = NebengOrderResponse().obs;

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
    var whatsapp = "+6285250223238";
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
        if (res['success'] == true) {
          orderResponse.value = NebengOrderResponse.fromJson(res['data']);
          controllerUserInfo.setActiveOrder(
            orderResponse.value.nebengPost?.id ?? 0,
            "nebeng",
          );
          controllerUserInfo.setUserHasActiveOrder(true);
          change(orderResponse.value, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        throw "error user not found";
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error());
    }
  }
}
