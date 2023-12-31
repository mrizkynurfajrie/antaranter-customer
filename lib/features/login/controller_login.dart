import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'api_login.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final formkeyLogin = GlobalKey<FormState>();
  var obsecurePass = true.obs;

  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  var edtPhoneControl = TextEditingController();
  var edtPassword = TextEditingController();

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;

  @override
  void onClose() {
    super.onClose();
    edtPhoneControl.dispose();
    edtPassword.dispose();
  }

  validator()async{
    if(formkeyLogin.currentState!.validate()){
      login();
    }else{
      log('Please check input data');
    }
  }

  showPass()async{
    if(obsecurePass.value == true){
      obsecurePass.value = false;
    }else{
      obsecurePass.value = true;
    }
  }

  login() async {
    try {
      loading(true);
      String? fcmToken = await messaging.getToken();
      var loginResult = await api.loginApiRunning(
        phoneNum: edtPhoneControl.text,
        password: edtPassword.text,
        fcm: fcmToken ?? "00",
      );
      print(loginResult.toString());
      loading(false);
      if (loginResult != null) {
        if (loginResult['success'] == true) {
          var detailUser = loginResult["data"]["user"];
          var result = User.fromJson(detailUser);
          controllerUserInfo.user.value = result;
          await Api2().setUser(user: result.toJson());
          var tokenUser = loginResult["data"]["token"];
          token.value = tokenUser;
          await Api2().setToken(token: token.value);
          loginStatus = true;
          await Api2().setIsLogin(isLogin: loginStatus);
          Get.offNamed(Routes.main);
        } else {
          var firstError = loginResult['errors'][0];
          throw firstError['message'];
        }
      } else {
        var firstError = loginResult['errors'][0];
        throw firstError['message'];
      }
      loading(false);
    } catch (e) {
      loading(false);
      log(e.toString());
      dialogError(
          errorTitle: 'Sign In',
          message: e.toString()
      );
    }
  }

  regisRoute() {
    Get.toNamed(Routes.register);
  }

  forgetPasswordRoute() {
    Get.toNamed(Routes.forgetpassword);
  }
}
