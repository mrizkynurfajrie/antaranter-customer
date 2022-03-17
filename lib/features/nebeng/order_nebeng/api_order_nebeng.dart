import 'package:intake_customer/framework/api1.dart';

class ApiOrderNebeng {
  Future<dynamic> orderNebeng(int userId,int nebengPostingId) async {
    final orderNebengBody = {
      "user_id" : userId,
      "nebeng_posting_id" : nebengPostingId
    };
    var response = await Api1().apiJSONPost("orderriders/create",orderNebengBody);
    // log('return data = ' + apiLoginResponse.toString());

    return response;
  }
}