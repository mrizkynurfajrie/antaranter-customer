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

  Future<dynamic> autoLoginApiRunning(
      {required var phoneNum,
        required String password,
        required String fcm}) async {
    final loginBody = {"phone": phoneNum, "password": password, "fcm": fcm};

    var apiLoginResponse = await Api1().apiJSONPost("login-user", loginBody);
    // log('return data = ' + apiLoginResponse.toString());

    return apiLoginResponse;
  }
  
}