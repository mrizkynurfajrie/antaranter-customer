import 'dart:io';

import 'package:get/get.dart';
import 'package:intake_customer/framework/api1.dart';
import 'package:url_launcher/url_launcher.dart';

class ControllerContactUs extends GetxController{

  // ourWa() async {
  //   var whatsapp = "+6282259304664";
  //   var whatsappURlAndroid = "https://wa.me/$whatsapp?text=${Uri.parse("halo driver saya telah memesan nebeng anda")}";
  //   var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  //
  //   if (Platform.isIOS) {
  //     // for iOS phone only
  //     if (await canLaunch(whatappURLIos)) {
  //       await launch(whatappURLIos, forceSafariVC: false);
  //     } else {
  //       Get.snackbar('Attention', "whatsapp no installed");
  //     }
  //   } else {
  //     // android , web
  //
  //     if (await canLaunch(whatsappURlAndroid)) {
  //       await launch(whatsappURlAndroid);
  //     } else {
  //       Get.snackbar('Attention', "whatsapp no installed android");
  //     }
  //   }
  // }

  ourIg()async{
    var igUrl = "https://www.instagram.com/indoteknokarya_id/";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(igUrl)) {
        await launch(igUrl, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "Instagram no installed");
      }
    } else {
      // android , web

      if (await canLaunch(igUrl)) {
        await launch(igUrl);
      } else {
        Get.snackbar('Attention', "Instagram no installed android");
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
        Get.snackbar('Attention', "Facebook no installed");
      }
    } else {
      // android , web

      if (await canLaunch(igUrl)) {
        await launch(igUrl);
      } else {
        Get.snackbar('Attention', "Facebook no installed android");
      }
    }
  }

  ourEmail()async{
    var toEmail = "indoteknokarya@gmail.com";
    var subject = "Call center help service";
    var message = "Silahkan masukan apa yang menjadi kendala anda sekarang\n...\n";

    var emailUrl = 'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(emailUrl)) {
        await launch(emailUrl, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    } else {
      // android , web

      if (await canLaunch(emailUrl)) {
        await launch(emailUrl);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    }
  }

  ourWeb()async{
    var igUrl = Api1().webUrl;
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(igUrl)) {
        await launch(igUrl, forceSafariVC: false);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    } else {
      // android , web

      if (await canLaunch(igUrl)) {
        await launch(igUrl);
      } else {
        Get.snackbar('Attention', "Something is wrong");
      }
    }
  }
}