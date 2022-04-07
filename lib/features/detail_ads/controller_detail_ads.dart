import 'dart:io';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ControllerDetailAds extends GetxController {
  late WebViewController webViewcontroller;
  var idAds = 0.obs;
  var loading = true.obs;
  @override
  void onInit() {
    idAds.value = Get.arguments;
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // TODO: implement onInit
    super.onInit();
  }
}
