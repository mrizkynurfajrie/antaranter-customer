import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/register/api_register.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ControllerRegister extends GetxController{
  final ApiRegister api;
  ControllerRegister({required this.api});

  String kodeNegara = 'ID';
  PhoneNumber numberID = PhoneNumber(isoCode: 'ID');

  var edtPhoneNum = TextEditingController();
  var edtPswd = TextEditingController();

  var loading = false;

  @override
  void onClose() {
    super.onClose();
    edtPhoneNum.dispose();
    edtPswd.dispose();
  }

  register()async{
    try{
      loading = true;
      var regisResult = await api.registerApiRunning(phone: edtPhoneNum.text, password: edtPswd.text);
      loading = false;
      if(regisResult != null){
        var successStatus = regisResult["success"];
        if(successStatus != false){
          Get.snackbar(
              "Register",
              'Register is success',
              snackPosition: SnackPosition.BOTTOM
          );
        }
      }
      loading = false;
    }catch(e){
      log(e.toString());
      loading = false;
    }
  }
}