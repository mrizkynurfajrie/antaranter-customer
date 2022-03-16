import 'dart:developer';
import 'package:intake_customer/framework/api1.dart';

class ApiLogin {
  Future<dynamic> loginApiRunning(
      {required var phoneNum,
      required String password,
      required String fcm}) async {
    final loginBody = {"phone": phoneNum, "password": password, "fcm": fcm};

    var apiLoginResponse = await Api1().apiJSONPost("login-user", loginBody);
    // log('return data = ' + apiLoginResponse.toString());

    return apiLoginResponse;
  }
}
