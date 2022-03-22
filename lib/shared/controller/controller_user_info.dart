import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';

class ControllerUserInfo extends GetxController {
  var hasActiveOrder = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkUserHasActiveOrder();
  }

  void setUserHasActiveOrder(bool status) async {
    await Api2().setHasActiveOrder(isHasActiveOrder: status);
    hasActiveOrder.value = status;
  }

  void checkUserHasActiveOrder() async {
    // TODO CHECK STATUS FROM BE FOR SURE
    var isHasActiveOrder = await Api2().getHasActiveOrder();
    if (isHasActiveOrder != null) {
      setUserHasActiveOrder(isHasActiveOrder);
    }
  }

  void setActiveOrder(int idOrder, String type) async {
    await Api2().setActiveOrder(activeOrder: {'id': idOrder,'type':type});
  }
}
