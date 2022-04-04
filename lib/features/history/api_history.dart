import 'dart:developer';

import 'package:intake_customer/framework/api1.dart';

class ApiHistory{
  Future<dynamic> historyApiRunning({required var users_id})async{
    final bodyJson={
      "users_id" : users_id
    };
    
    var apiHistoryResponse = await Api1().apiJSONPostWithToken('nebengorders/liststatusclosedabortedbyuser', bodyJson);
    return apiHistoryResponse;
  }
}