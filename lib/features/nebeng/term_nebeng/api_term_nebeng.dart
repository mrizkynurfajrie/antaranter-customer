import 'package:intake_customer/framework/api1.dart';

class ApiTermNebeng {
  Future<dynamic> termNebeng() async {
    var response = await Api1().apiJSONGetWitToken("terms/2");
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}