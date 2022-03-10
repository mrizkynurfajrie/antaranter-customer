import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/api_detail_nebeng.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/controller_detail_nebeng.dart';

class BindingDetailNebeng implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerDetailNebeng>(() => ControllerDetailNebeng(api: ApiDetailNebeng()));
  }
}