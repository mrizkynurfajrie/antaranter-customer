import 'package:intake_customer/framework/api1.dart';

class ApiHome {
  Future<dynamic> homeUser(int id) async {
    var response = await Api1().apiJSONGetWitToken("home/me/$id");
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}