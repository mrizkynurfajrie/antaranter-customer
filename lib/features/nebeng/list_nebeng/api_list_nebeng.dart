import 'package:intake_customer/framework/api1.dart';

class ApiListNebeng {
  Future<dynamic> listNebeng() async {
    var response = await Api1().apiJSONGetWitToken("nebengposts/list");
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}
