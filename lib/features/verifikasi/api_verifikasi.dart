import 'package:intake_customer/framework/api1.dart';

class ApiVerifikasi{

  Future<dynamic> verifikasiApiRunning ({
  required var name,
  required var ktp,
  required var email,
  required var image,
  required var birth,
  required var address,
  required var nik,
  required var lat,
  required var lng,
  required var city,
  required var id_user
}) async {

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
    // log("Cek data : " + apiVerifikasiResponse.toString());

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

}