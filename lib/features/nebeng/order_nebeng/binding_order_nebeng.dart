import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/api_order_nebeng.dart';
import 'package:intake_customer/features/nebeng/order_nebeng/controller_order_nebeng.dart';

class BindingOrderNebeng implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerOrderNebeng>(() => ControllerOrderNebeng(api: ApiOrderNebeng()));
  }
}