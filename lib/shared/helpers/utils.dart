import 'package:flutter/material.dart';
import 'package:intake_customer/framework/api1.dart';

dismisKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String imageUrlPath(String fileName) {
  return "${Api1().baseUrl}images/$fileName";
}

String statusOrderNebeng(int status) {
  var statusValue = '';
  switch (status) {
    case 1:
      {
        statusValue = "Terjadwal";
      }
      break;

    case 2:
      {
        statusValue = "Dijalan";
      }
      break;
    case 3:
      {
        statusValue = "Selesai";
      }
      break;
    case 4:
      {
        statusValue = "Dibatalkan";
      }
      break;
  }
  return statusValue;
}
