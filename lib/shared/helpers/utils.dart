import 'package:flutter/material.dart';
import 'package:intake_customer/framework/api1.dart';

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String imageUrlPath(String fileName) {
  return "${Api1().baseUrl}images/$fileName";
}
