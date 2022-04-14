import 'package:intake_customer/framework/api1.dart';

class ApiDetailHistory{
  Future<dynamic> detailHistory({required var id})async{
    
    var responseData = await Api1().apiJSONGetWitToken('nebengorders/$id');
    return responseData;
  }
}