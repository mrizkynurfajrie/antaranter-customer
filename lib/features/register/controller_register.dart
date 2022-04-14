import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intake_customer/features/register/api_register.dart';
import 'package:intake_customer/routes/app_routes.dart';
import 'package:intake_customer/shared/helpers/utils.dart';
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

  void regisAgreemnet(bool status) => regisAgree.value = status;

  checkAgreement(){
    if(regisAgree.value == true){
      if(formkeyRegis.currentState!.validate()){
        dismisKeyboard();
        register();
      }
    }else{
      Get.snackbar(
          "Register",
          'Please make sure your are agree with our term and condition',
          snackPosition: SnackPosition.BOTTOM
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
      print(regisResult);
      if(regisResult != null){
        var successStatus = regisResult["success"];
        if(successStatus == true){
          Get.back();
          Get.snackbar(
              "Registration",
              'Registration is success, please login'
          );
        }else{
          var firstError = regisResult['errors'][0];
          Get.snackbar("Kesalahan", firstError['message']);
        }
      }
      loading.value = false;
    } catch (e) {
      log(e.toString());
      loading.value = false;
    }
  }
}
