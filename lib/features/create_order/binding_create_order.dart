import 'package:get/get.dart';
import 'package:intake_customer/features/create_order/api_create_order.dart';
import 'package:intake_customer/features/create_order/controller_create_order.dart';

class BindingCreateOrder implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerCreateOrder>(() => ControllerCreateOrder(api: ApiCreateOrder()));
  }
}