import 'package:get/get.dart';
import 'package:intake_customer/features/detail_history/api_detail_history.dart';
import 'package:intake_customer/response/nebeng_order_response.dart';

class ControllerDetailHistory extends GetxController
    with StateMixin<NebengOrderResponse> {
  final ApiDetailHistory api;
  ControllerDetailHistory({required this.api});

  var orderResponse = NebengOrderResponse().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getDetailHistoryOrder();
    super.onInit();
  }

  Future<void> getDetailHistoryOrder() async {
    change(null, status: RxStatus.loading());
    try {
      var res = await api.detailHistory(id: Get.arguments);
      if (res['success'] == true) {
        orderResponse.value = NebengOrderResponse.fromJson(res['data']);
        change(orderResponse.value, status: RxStatus.success());
      } else {
        throw "Terjadi kesalahan";
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  String statusOrderNebeng() {
    var statusValue = '';
    switch (orderResponse.value.nebengOrder?.status ?? 0) {
      case 1:
        {
          statusValue = "Terjadwal";
        }
        break;

      case 2:
        {
          statusValue = "Dalam Perjalanan";
        }
        break;
      case 3:
        {
          statusValue = "Selesai";
        }
        break;
      case 4:
        {
          statusValue = "Dibatalkan";
        }
        break;
    }
    return statusValue;
  }
  bool isOnScheduleActive() {
    int status = orderResponse.value.nebengOrder?.status ?? 0;
    return status == 1 || status == 2 || status == 3 || status == 4;
  }

  bool isOnTheWayActive() {
    int status = orderResponse.value.nebengOrder?.status ?? 0;
    return status == 2 || status == 3;
  }

  bool isOnFinishActive() {
    int status = orderResponse.value.nebengOrder?.status ?? 0;
    return status == 3;
  }

  bool isOnCanceledActive() {
    int status = orderResponse.value.nebengOrder?.status ?? 0;
    return status == 4;
  }
}
