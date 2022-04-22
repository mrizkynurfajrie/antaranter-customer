import 'dart:developer';

import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/api_order_nebeng.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/nebeng_response.dart';
import 'package:intake_customer/response/nebeng_order_response.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intake_customer/shared/helpers/format_date_time.dart';
import 'package:intake_customer/shared/helpers/local_notification_service.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';

class ControllerOrderNebeng extends GetxController {
  var controllerUserInfo = Get.find<ControllerUserInfo>();

  final ApiOrderNebeng api;
  ControllerOrderNebeng({required this.api});

  var postinganNebeng = NebengResponse().obs;

  @override
  void onInit() {
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
        await Future.delayed(const Duration(seconds: 2));
        // print(res.toString());
        // TODO status activity set true save response
        if (res['success'] == true) {
          controllerUserInfo.setUserHasActiveOrder(true);
          var orderNebengRes = NebengOrderResponse.fromJson(res['data']);
          controllerUserInfo.setActiveOrder(
            orderNebengRes.nebengOrder?.id ?? 0,
            "nebeng",
          );
          addReminderNebeng(orderNebengRes);
          // IF SUCCESS GO TO PAGE DETAIL ORDER NEBENG
          Get.offAllNamed(Routes.main, arguments: 1);
        } else {
          Get.back();
          String? error = res['errors'][0]['message']['message'];
          // Get.snackbar("Gagal memesan", error ?? "Gagal melakukan pemesanan");
          throw error ?? "Gagal melakukan pemesanan";
        }
      } catch (e) {
        // TODO HANDLE ERROR
        log(e.toString());
        showPopUpError(errorMessage: e.toString());
      }
    }
  }

  void addReminderNebeng(NebengOrderResponse nebengOrderResponse) {
    var dateTimeDep = LocaleTime.parseDate(
        dateString:
            "${LocaleTime.stringDateToDateTime(nebengOrderResponse.nebengPost!.dateDep!.toString()).toString()} ${nebengOrderResponse.nebengPost!.timeDep}");
    log(dateTimeDep.toString());
    // var scheduleTime = DateTime.utc(dateDep!.year, dateDep.month, dateDep.day);
    LocalNotificationService.addScheduleNotification(
      id: nebengOrderResponse.nebengOrder!.id!,
      title: "AntarAnter",
      body: 'Hai , jangan lupa waktu keberangkatan nebeng kamu pada ',
      schedule: dateTimeDep.subtract(const Duration(minutes: 30)),
    );
  }
}
