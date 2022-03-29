import 'dart:io';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerContactUs extends GetxController{

  ourWa() async {
    var whatsapp = "+6285250223238";
    var whatsappURlAndroid = "https://wa.me/$whatsapp?text=${Uri.parse("halo driver saya telah memesan nebeng anda")}";
    var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed");
      }
    } else {
      // android , web

      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed android");
      }
    }
  }

  ourIg()async{
    var igUrl = "https://www.instagram.com/indoteknokarya_id/";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(igUrl)) {
        await launch(igUrl, forceSafariVC: false);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed");
      }
    } else {
      // android , web

      if (await canLaunch(igUrl)) {
        await launch(igUrl);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed android");
      }
    }
  }

  ourFb()async{
    var igUrl = "https://www.facebook.com/indoteknokarya.indoteknokarya";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(igUrl)) {
        await launch(igUrl, forceSafariVC: false);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed");
      }
    } else {
      // android , web

      if (await canLaunch(igUrl)) {
        await launch(igUrl);
      } else {
        Get.snackbar('perhatian', "whatsapp no installed android");
      }
    }
  }
}