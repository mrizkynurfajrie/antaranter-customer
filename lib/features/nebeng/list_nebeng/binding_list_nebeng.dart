import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/api_list_nebeng.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/controller_list_nebeng.dart';

class BindingListNebeng implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ControllerListNebeng>(() => ControllerListNebeng(api: ApiListNebeng()));
  }
}