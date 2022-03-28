import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/api_term_nebeng.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/controller_term_nebeng.dart';

class BindingTermNebeng implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerTermNebeng>(() => ControllerTermNebeng(api: ApiTermNebeng()));
  }
}