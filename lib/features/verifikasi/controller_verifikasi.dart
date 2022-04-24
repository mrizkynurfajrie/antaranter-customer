import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_customer/features/verifikasi/api_verifikasi.dart';
import 'package:intake_customer/framework/api2.dart';
import 'package:intake_customer/response/daftar_kota.dart';
import 'package:intake_customer/response/daftar_provinsi.dart';
import 'package:intake_customer/response/user.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/controller/controller_user_info.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:intl/intl.dart';

class ControllerVerifikasi extends GetxController {
  final ApiVerifikasi api;
  ControllerVerifikasi({required this.api});

  var edt_name = TextEditingController();
  var edt_email = TextEditingController();
  var edt_alamat = TextEditingController();
  var edt_nik = TextEditingController();
  var edt_gender = TextEditingController();

  var pict = ''.obs;
  var datePick = ''.obs;
  var imgPreview = ''.obs;
  var ktpPreview = ''.obs;
  var uploadImg = '';
  var uploadKtp = '';
  var showImg = ''.obs;
  var id_user = 0.obs;
  var id_provinsi = 0;
  var name_provinsi = ''.obs;
  var name_kota = ''.obs;

  // var checker = false;
  final formkeyVerif = GlobalKey<FormState>();

  ScrollController loadController = ScrollController();

  RxList<DaftarPronvinsi> allProvincie = <DaftarPronvinsi>[].obs;
  RxList<DaftarKota> allKota = <DaftarKota>[].obs;

  var loading = false.obs;

  final ImagePicker picker = ImagePicker();

  DateTime? date = DateTime.now();

  var mainController = Get.find<ControllerUserInfo>();

  @override
  void onInit() {
    getProvincies();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    edt_name.dispose();
    edt_email.dispose();
    edt_alamat.dispose();
    edt_nik.dispose();
    edt_gender.dispose();
  }

  inputDate(BuildContext context) async {
    final DateTime? select = await showDatePicker(
        context: context,
        initialDate: date!,
        firstDate: DateTime(1950),
        lastDate: DateTime(2025),
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        });

    if (select != null && select != date) {
      date = select;
      datePick.value = DateFormat('yyyy-MM-dd').format(date!);
    } else {
      datePick.value = "Tgl. Lahir";
    }
  }

  genderSelect(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
              child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading:
                        Icon(CupertinoIcons.person_fill, color: Colors.blue),
                    title: Text('Male'),
                    onTap: () {
                      edt_gender.text = 'Male';
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(CupertinoIcons.person_fill, color: Colors.pink),
                  title: Text('Female'),
                  onTap: () {
                    edt_gender.text = 'Female';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ));
        });
  }

  //gambar profile
  getFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    imgPreview.value = camImage!.path;
  }

  getFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    imgPreview.value = fileImage!.path;
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
  getKtpFromCamera() async {
    final XFile? camImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    ktpPreview.value = camImage!.path;
  }

  getKtpFromFile() async {
    final XFile? fileImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
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

  //pilih provinsi
  getProvincies() async {
    try {
      loading.value = true;
      var provinsi = await api.getProvinsi();
      if (provinsi != null) {
        var daftarProvin = provinsi["data"];
        allProvincie(RxList<DaftarPronvinsi>.from(
            daftarProvin.map((e) => DaftarPronvinsi.fromJson(e))));
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
    }
  }

  popUpProvinsi() {
    Get.defaultDialog(
        title: 'Provinsi',
        titleStyle: TextStyle(
          color: AppColor.primaryColor.shade600,
        ),
        content: Container(
            height: Get.height * 0.4,
            width: Get.width * 0.8,
            child: ListView.builder(
                controller: loadController,
                itemCount: allProvincie.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      id_provinsi = allProvincie[index].id;
                      name_provinsi.value = allProvincie[index].name;
                      getKota();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(allProvincie[index].name),
                    ),
                  );
                })));
  }

  //pilih kota
  getKota() async {
    try {
      loading.value = true;
      allKota.clear();
      var kota = await api.getKota((id_provinsi == 0) ? 0 : id_provinsi);
      log(kota.toString());
      if (kota != null) {
        var daftarKota = kota["data"];
        allKota(RxList<DaftarKota>.from(
            daftarKota.map((e) => DaftarKota.fromJson(e))));
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log("Error get kota : " + e.toString());
    }
  }

  popUpKota() {
    Get.defaultDialog(
        title: 'Kota',
        titleStyle: TextStyle(
          color: AppColor.primaryColor.shade600,
        ),
        content: Container(
            height: Get.height * 0.4,
            width: Get.width * 0.8,
            child: ListView.builder(
                controller: loadController,
                itemCount: allKota.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      name_kota.value = allKota[index].name;
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      title: Text(allKota[index].name),
                    ),
                  );
                })));
  }

  uploadImgProfile() async {
    try {
      var uploadSelImg =
          await api.uploadProfileImg(ProfileImg: imgPreview.value);
      if (uploadSelImg != null) {
        var selfImgValue = uploadSelImg["data"]["key"];
        uploadImg = selfImgValue;
      }
    } catch (e) {
      log(e.toString());
      loading.value = false;
      dialogError(errorTitle: 'Failed',message: e.toString());
    }
  }

  uploadImgktp() async {
    try {
      var uploadSelktp =
          await api.uploadProfileKtp(ProfileKtp: ktpPreview.value);
      if (uploadSelktp != null) {
        var selfKtpValue = uploadSelktp["data"]["key"];
        uploadKtp = selfKtpValue;
      }
    } catch (e) {
      log(e.toString());
      loading.value = false;
      dialogError(errorTitle: 'Failed',message: e.toString());
    }
  }

  validator() async {
    if (formkeyVerif.currentState!.validate()) {
      loading.value = true;
      await uploadImgProfile();
      await uploadImgktp();
      updateProfile();
    }
  }

  updateProfile() async {
    try {
      loading.value = true;
      var verifResult = await api.verifikasiApiRunning(
        name: edt_name.text,
        ktp: uploadKtp,
        email: edt_email.text,
        image: uploadImg,
        gender: edt_gender.text,
        birth: datePick.value,
        address: edt_alamat.text,
        nik: edt_nik.text,
        city: name_kota.value,
        id_user: mainController.user.value.id,
      );
      log(verifResult.toString());
      if (verifResult['success'] == true) {
        var result = verifResult["data"];
        await Api2().setUser(user: result);
        var user = User.fromJson(result);
        mainController.user.value = user;
        if (mainController.user.value.ktpPict != null &&
            mainController.user.value.nik != null) {
          var resultUserVerify =
              await api.verifyUser(id: mainController.user.value.id);
          log(resultUserVerify.toString());
          if (resultUserVerify['success'] == true) {
            mainController.user.value.status = 2;
            mainController.user.refresh();
            await Api2().setUser(user: mainController.user.value.toJson());
            dialogNormal(
                normalTilte: "verification",
                normalMessage: "Your account has been updated");
          } else {
            throw "Something error verify user";
          }
        } else {
          dialogNormal(
              normalTilte: "verification",
              normalMessage:
                  "Your account has been updated, please fill in your identity card and identity number");
        }
      } else {
        throw "Something error update data";
      }
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
      dialogError(errorTitle: 'Failed', message: e.toString());
    }
  }
}
