import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/loginResponse.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'api_login.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  var edtPhoneControl = TextEditingController();
  var edtPassword = TextEditingController();

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;

  @override
  void onInit() {
    // checkLogin();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edtPhoneControl.dispose();
    edtPassword.dispose();
  }

  login() async {
    try {
      loading(true);
      var loginResult = await api.loginApiRunning(
          phoneNum: edtPhoneControl.text, password: edtPassword.text);
      loading(false);
      if (loginResult != null){
        var detailUser = loginResult["data"]["user"];
        loginResponse result = loginResponse.fromJson(detailUser);
        var tokenUser = loginResult["data"]["token"];
        token.value = tokenUser;
        Api2().setToken(token: token.value);
        loginStatus = true;
        Api2().setIsLogin(isLogin: loginStatus);
        // Get.off(newPage);
      }
      loading(false);
    } catch (e) {
      log(e.toString());
      loading(false);
    }
  }

  // checkLogin(){
  //   var statusLogin = Api2().getLoginStatus();
  //   if(statusLogin == true){
  //     Get.off(newPage);
  //   }
  // }
}
