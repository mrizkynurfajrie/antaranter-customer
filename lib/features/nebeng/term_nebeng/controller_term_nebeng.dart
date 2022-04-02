import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/term_nebeng/api_term_nebeng.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/term_condition.dart';

class ControllerTermNebeng extends GetxController {
  final ApiTermNebeng api;

  ControllerTermNebeng({required this.api});

  var termCondition = TermCondition().obs;

  var loading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  var agreementStatus = false.obs;

  void changeAgreemnetStatus(bool status) => agreementStatus.value = status;

  void getData() async {
    try {
      var res = await api.termNebeng();
      if (res['success'] == true) {
        termCondition.value = TermCondition.fromJson(res['data']);
        // print("disini");
        loading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void agreeTermNebeng() async {
    await Api2().setAgreementNebeng(status: true);
  }
}
