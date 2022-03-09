import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intake_customer/features/verifikasi/api_verifikasi.dart';
import 'package:intake_customer/framework/api2.dart';

class ControllerVerifikasi extends GetxController{
  final ApiVerifikasi api;
  ControllerVerifikasi({required this.api});

  var edt_name = TextEditingController();
  var edt_email = TextEditingController();
  var edt_ponsel = TextEditingController();
  var edt_alamat = TextEditingController();
  var edt_kota = TextEditingController();
  var edt_nik = TextEditingController();

  var nama = ''.obs;
  var pict = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var datePick = ''.obs;
  var Img = ''.obs;
  var ktp = ''.obs;
  var nik = ''.obs;

  final ImagePicker picker = ImagePicker();

  DateTime? date = DateTime.now();


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
    edt_ponsel.dispose();
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
      datePick.value = "${date?.toLocal()}".split(' ')[0];
    }else{
      datePick.value = "Tgl. Lahir";
    }
  }

  //gambar profile
  getFromCamera()async{
    final XFile? camImage = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    Img.value = camImage!.path;
  }
  getFromFile()async{
    final XFile? fileImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    Img.value = fileImage!.path;
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
    ktp.value = camImage!.path;
  }
  getKtpFromFile()async{
    final XFile? fileImage = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    ktp.value = fileImage!.path;
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
}

// Container(
//   margin: EdgeInsets.only(top: 10),
//   child: CircleAvatar(
//     radius: 50,
//     backgroundImage:
//     AssetImage(controller.pict.value),
//   ),
// )

// Container(
//   alignment: Alignment.topCenter,
//   margin: EdgeInsets.only(top: 20),
//   height: 60,
//   width: 60,
//   decoration: const BoxDecoration(
//       borderRadius:
//       BorderRadius.all(Radius.circular(100)),
//       color: Color(0xffffffff)),
//   child: Icon(
//     CupertinoIcons.person_fill,
//     size: 55,
//     color: AppColor.bodyColor.shade600,
//   ),
// )