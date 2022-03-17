import 'dart:developer';

import 'package:intake_customer/framework/api1.dart';

class ApiVerifikasi{

  Future<dynamic> verifikasiApiRunning ({
  required var name,
  required var ktp,
  required var email,
  required var image,
  required var birth,
  required var address,
  required var phone,
  required var lat,
  required var lng,
  required var city,
  required var id_user
}) async {

    final inputBody = {
      "name" : name,
      "ktp" : ktp,
      "email" : email,
      "image" : image,
      "birth" : birth,
      "address" : address,
      "phone" : phone,
      "lat" : lat,
      "lng" : lng,
      "city" : city
    };

    var apiVerifikasiResponse = await Api1().apiJSONPostWithToken('users/update-profile/'+id_user, inputBody);
    // log("Cek data : " + apiVerifikasiResponse);

    return apiVerifikasiResponse;

  }

  Future<dynamic>uploadProfileImg({required String ProfileImg})async{
    var upload = Api1().apiJSONMultipartWithToken(ProfileImg, 'upload');
    log('cek responsed : $upload');

    return upload;
  }

  Future<dynamic>uploadProfileKtp({required String ProfileKtp})async{
    var upload = Api1().apiJSONMultipartWithToken(ProfileKtp, 'upload');
    log('cek response : $upload');

    return upload;
  }

}