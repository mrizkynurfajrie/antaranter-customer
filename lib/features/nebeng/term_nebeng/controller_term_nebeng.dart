import 'package:get/get.dart';

class ControllerTermNebeng extends GetxController {
  var agreementStatus = false.obs;

  void changeAgreemnetStatus(bool status) => agreementStatus.value = status;
}
