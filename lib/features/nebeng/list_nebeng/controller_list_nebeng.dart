import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/list_nebeng/api_list_nebeng.dart';
import 'package:intake_customer/response/nebengResponse.dart';

class ControllerListNebeng extends GetxController
    with StateMixin<List<NebengResponse>> {
  final ApiListNebeng api;
  ControllerListNebeng({required this.api});

  final listNebeng = List<NebengResponse>.empty().obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    change(null, status: RxStatus.loading());
    try {
      var res = await api.listNebeng();
      if (res['success'] == true) {
        var data = res['data'];
        var resultNebeng = (data as List)
            .map((data) => new NebengResponse.fromJson(data))
            .toList();
        listNebeng.addAll(resultNebeng);
        // print(listNebeng);
        change(listNebeng, status: RxStatus.success());
      }
    } catch (e) {
      print(e.toString());
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
