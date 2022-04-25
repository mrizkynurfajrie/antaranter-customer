import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ControllerForgetPassword extends GetxController{

  var edtPhoneInput = TextEditingController();

  var loading = false.obs;

  final formkeyForgetPass = GlobalKey<FormState>();

  String initialCountry = 'ID';
  PhoneNumber number = PhoneNumber(isoCode: 'ID');

  validator()async{
    if(formkeyForgetPass.currentState!.validate()){
      log('Berhasil');
    }else{
      log('Gagal');
    }
  }

}