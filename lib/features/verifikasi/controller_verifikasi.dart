import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_customer/features/verifikasi/api_verifikasi.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intl/intl.dart';

class ControllerVerifikasi extends GetxController{
  final ApiVerifikasi api;
  ControllerVerifikasi({required this.api});

  var edt_name = TextEditingController();
  var edt_email = TextEditingController();
  var edt_alamat = TextEditingController();
  var edt_kota = TextEditingController();
  var edt_nik = TextEditingController();

  var nama = ''.obs;
  var pict = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var datePick = ''.obs;
  var imgPreview = ''.obs;
  var ktpPreview = ''.obs;
  var uploadImg = '';
  var uploadKtp = '';
  var nik = ''.obs;
  var id_user = 0.obs;
  var lat = 0.0;
  var lang = 0.0;

  XFile? img;
  var loading = false;

  final ImagePicker picker = ImagePicker();

  DateTime? date = DateTime.now();

  var mainController = Get.find<ControllerUserInfo>();


  @override
  void onInit(){
    setProfile();
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
    edt_name.dispose();
    edt_email.dispose();
    edt_alamat.dispose();
    edt_kota.dispose();
    edt_nik.dispose();
  }

  setProfile()async{
    var userDetail = await Api2().getUser();
    pict.value = userDetail['image'] ?? "";
    nama.value = userDetail['username'] ?? "Pelanggan";
    phone.value = userDetail['phone'] ?? "08xxxxxxxxxx";
    email.value = userDetail['email'] ?? "name@email.com";
    id_user.value = userDetail['id'] ?? 0;

    lat = (await Api2().getLatitude())!;
    lang = (await Api2().getLongitude())!;
  }

  inputDate(BuildContext context)async{
    final DateTime? select = await showDatePicker(
        context: context,
        initialDate: date!,
        firstDate: DateTime(1950),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });

    if(select != null && select != date){
      date = select;
      datePick.value = DateFormat('dd-MM-yyyy').format(date!);
    }else{
      datePick.value = "Tgl. Lahir";
    }
  }

  //gambar profile
  getFromCamera()async{
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    imgPreview.value = camImage!.path;
    img = camImage;
  }
  getFromFile()async{
    final XFile? fileImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    imgPreview.value = fileImage!.path;
    // img = fileImage;
  }
  imgSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.photo_camera),
                        title: Text('Camera'),
                        onTap: () {
                          getFromCamera();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Image Gallery'),
                      onTap: () {
                        getFromFile();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
        });
  }

  //gambar ktp
  getKtpFromCamera()async{
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    ktpPreview.value = camImage!.path;
  }
  getKtpFromFile()async{
    final XFile? fileImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    ktpPreview.value = fileImage!.path;
  }
  ktpSourceSelector(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.photo_camera),
                        title: Text('Camera'),
                        onTap: () {
                          getKtpFromCamera();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Image Gallery'),
                      onTap: () {
                        getKtpFromFile();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ));
        });
  }

  uploadImgProfile()async{
    try{
      var uploadSelImg = await api.uploadProfileImg(ProfileImg: imgPreview.value);
      if(uploadSelImg!= null){
        var selfImgValue = uploadSelImg["data"]["filename"];
        uploadImg = selfImgValue;
      }
    }catch(e){
      log(e.toString());
    }
  }

  uploadImgktp()async{
    try{
      var uploadSelktp = await api.uploadProfileKtp(ProfileKtp: ktpPreview.value);
      if(uploadSelktp != null){
        var selfKtpValue = uploadSelktp["data"]["filename"];
        uploadKtp = selfKtpValue;
      }
    }catch(e){
      log(e.toString());
    }
  }

  updateProfile()async{
    try{
      loading = true;
      var verifResult = await api.verifikasiApiRunning(
          name: edt_name.text,
          ktp: uploadKtp,
          email: edt_email.text,
          image: uploadImg,
          birth: datePick.value,
          address: edt_alamat.text,
          nik: edt_nik.text,
          lat: lat,
          lng: lang,
          city: edt_kota.text,
          id_user: id_user.value
      );
      if(verifResult != null){
        var result = verifResult["data"];
        await Api2().setUser(user: result);
        var user = User.fromJson(result);
        Get.find<ControllerUserInfo>().user.value = user;
        Get.snackbar(
            "Verifikasi",
            "Your account has been updated",
            snackPosition: SnackPosition.BOTTOM);
      }
      loading = false;
    }catch(e){
      loading = false;
      log(e.toString());
    }
  }
 }