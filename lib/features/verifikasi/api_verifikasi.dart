import 'dart:developer';

import 'package:intake_customer/framework/api1.dart';

class ApiVerifikasi{

  Future<dynamic> getProvinsi()async{
    var daftarProvinsi = await Api1().apiJSONGetWitToken('provincies/list');
    return daftarProvinsi;
  }

  Future<dynamic> getKota(int idProvinsi)async{
    final bodyJson = {
      "province_id" : idProvinsi
    };
    var daftarKota = await Api1().apiJSONPostWithToken('cities/findbyprovince', bodyJson);
    return daftarKota;
  }

  Future<dynamic> verifikasiApiRunning ({required var name, required var ktp, required var email, required var image, required var birth, required var address, required var nik, required var lat, required var lng, required var city, required var id_user}) async {

    final inputBody = {
      "username" : name,
      "ktp_pict" : ktp,
      "email" : email,
      "image" : image,
      "birth" : birth,
      "address" : address,
      "nik" : nik,
      "lat" : lat,
      "lang" : lng,
      "city" : city
    };

    var apiVerifikasiResponse = await Api1().apiJSONPostWithToken('users/update-profile/$id_user', inputBody);

    log("Cek input : " + inputBody.toString());

    return apiVerifikasiResponse;

  }

  Future<dynamic>uploadProfileImg({required String ProfileImg})async{
    var upload = Api1().apiJSONMultipartWithToken(ProfileImg, 'upload');
    // log('cek imgProfile : $upload');

    return upload;
  }

  Future<dynamic>uploadProfileKtp({required String ProfileKtp})async{
    var upload = Api1().apiJSONMultipartWithToken(ProfileKtp, 'upload');
    // log('cek imgKTP : $upload');

    return upload;
  }

  // 
  Future<dynamic> verifyUser ({required var id}) async {

    final body = {
      "id" : id,
    };

    var apiVerifikasiResponse = await Api1().apiJSONPostWithToken('users/approve', body);

    return apiVerifikasiResponse;

  }

}