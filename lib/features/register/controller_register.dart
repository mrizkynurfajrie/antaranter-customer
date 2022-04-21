import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/api_register.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ControllerRegister extends GetxController {
  final ApiRegister api;

  ControllerRegister({required this.api});

  String kodeNegara = 'ID';
  PhoneNumber numberID = PhoneNumber(isoCode: 'ID');

  var edtPhoneNum = TextEditingController();
  var edtPswd = TextEditingController();
  var loading = false.obs;
  var regisAgree = false.obs;
  final formkeyRegis = GlobalKey<FormState>();
  var obsecurePass = true.obs;
  var controllerUserInfo = Get.find<ControllerUserInfo>();
  var token = '';
  var loginStatus = false;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void regisAgreemnet(bool status) => regisAgree.value = status;

  checkAgreement(){
    if(regisAgree.value == true){
      if(formkeyRegis.currentState!.validate()){
        dismisKeyboard();
        register();
      }
    }else{
      dialogError(
          errorTitle: 'Sign Up',
          message: 'Password anda tidak sesuai dengan format yang ada'
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    edtPhoneNum.dispose();
    edtPswd.dispose();
  }

  showPass(){
    if(obsecurePass.value == true){
      obsecurePass.value = false;
    }else{
      obsecurePass.value = true;
    }
  }

  termCondtionPage(){
    Get.toNamed(Routes.termcondition);
  }

  register() async {
    try {
      loading.value = true;
      var regisResult = await api.registerApiRunning(
          phone: edtPhoneNum.text, password: edtPswd.text);
      if (regisResult != null) {
        var successStatus = regisResult["success"];
        if (successStatus == true) {
          String? fcmToken = await messaging.getToken();
          var autoSignin = await api.autoLoginApiRunning(
              phoneNum: edtPhoneNum.text,
              password: edtPswd.text,
              fcm: fcmToken ?? '00');
          if(autoSignin['success'] == true){
            var detailUser = autoSignin["data"]["user"];
            var result = User.fromJson(detailUser);
            controllerUserInfo.user.value = result;
            await Api2().setUser(user: result.toJson());
            var tokenUser = autoSignin["data"]["token"];
            token = tokenUser;
            await Api2().setToken(token: token);
            loginStatus = true;
            await Api2().setIsLogin(isLogin: loginStatus);
          }else{
            var autoSignInError = autoSignin["errors"];
            dialogError(errorTitle: "Kesalahan", message: autoSignInError["message"]);
          }
          Get.offNamed(Routes.main);
        } else {
          var firstError = regisResult['errors'][0];
          dialogError(errorTitle: "Kesalahan", message: firstError['message']);
        }
      }
      regisAgree.value = false;
      loading.value = false;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }
}
