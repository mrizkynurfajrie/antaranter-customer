import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/api_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/controller_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/controller_list_nebeng.dart';

class BindingTermNebeng implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerTermNebeng>(() => ControllerTermNebeng());
  }
}