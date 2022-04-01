import 'package:intake_customer/framework/api1.dart';

class ApiDetailNebeng {
  Future<dynamic> detailNebengOrder(int orderNebengId) async {
    var response = await Api1().apiJSONGetWitToken("nebengorders/$orderNebengId");
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }

  Future<dynamic> detailNebengOrderByUserId(int userId) async {
    final body = {
      "users_id" : userId,
    };
    var response = await Api1().apiJSONPostWithToken("nebengorders/findbyuser",body);
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }


  Future<dynamic> cancelNebengOrder(int idOrder) async {
    final body = {
      "status" : 4,
      "id" : idOrder,
    };
    var response = await Api1().apiJSONPostWithToken("nebengorders/updatestatus",body);
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}
