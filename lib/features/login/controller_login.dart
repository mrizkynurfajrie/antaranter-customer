import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/loginResponse.dart';
import 'package:intake_customer/routes/app_routes.dart';
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
  void onInit(){
    checkLogin();
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
        await Api2().setToken(token: token.value);
        loginStatus = true;
        await Api2().setIsLogin(isLogin: loginStatus);
        Get.offNamed(Routes.main);
      }
      loading(false);
    } catch (e) {
      log(e.toString());
      loading(false);
    }
  }

  checkLogin()async{
    var statusLogin = await Api2().getLoginStatus();
    log('cek status : ' + statusLogin.toString());
    if(statusLogin == true){
      Get.offNamed(Routes.main);
    }
  }

  regisRoute(){
    Get.toNamed(Routes.register);
  }
}
