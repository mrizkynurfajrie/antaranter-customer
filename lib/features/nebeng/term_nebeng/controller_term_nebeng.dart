import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/api_list_nebeng.dart';

class ControllerTermNebeng extends GetxController {
  var agreementStatus = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void changeAgreemnetStatus(bool status) => agreementStatus.value = status;
}
