import 'package:intake_customer/framework/api1.dart';

class ApiDetailNebeng {
  Future<dynamic> detailNebengOrder(int id) async {
    var response = await Api1().apiJSONGetWitToken("nebengorders/${id}");
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}
