import 'package:intake_customer/framework/api1.dart';

class ApiRegister{
  
  Future<dynamic> registerApiRunning ({required var phone, required String password}) async {
    
    final regisBody = {
      "phone" : phone,
      "password" : password
    };
    
    var apiRegisterResponse = await Api1().apiJSONPost('register-user', regisBody);
    // log('cek data : ' + apiRegisterResponse);

    return apiRegisterResponse;
  }
  
}