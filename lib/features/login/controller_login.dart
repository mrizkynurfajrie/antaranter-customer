import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'api_login.dart';

class ControllerLogin extends GetxController {
  final ApiLogin api;
  ControllerLogin({required this.api});

  var controllerUserInfo = Get.find<ControllerUserInfo>();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  var edtPhoneControl = TextEditingController();
  var edtPassword = TextEditingController();

  var loading = false.obs;
  var token = "".obs;
  var loginStatus = false;

  @override
  void onInit() {
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
      String? fcmToken = await messaging.getToken();
      var loginResult = await api.loginApiRunning(
        phoneNum: edtPhoneControl.text,
        password: edtPassword.text,
        fcm: fcmToken ?? "00",
      );
      // print(loginResult.toString());
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
          Get.snackbar("Kesalahan", firstError['message']);
        }
      }
      loading(false);
    } catch (e) {
      log(e.toString());
      Get.snackbar("Kesalahan", "Terjadi kesalahan");
      loading(false);
    }
  }

  checkLogin() async {
    var statusLogin = await Api2().getLoginStatus();
    log('cek status : ' + statusLogin.toString());
    if (statusLogin == true) {
      Get.offNamed(Routes.main);
    }
  }

  regisRoute() {
    Get.toNamed(Routes.register);
  }
}
