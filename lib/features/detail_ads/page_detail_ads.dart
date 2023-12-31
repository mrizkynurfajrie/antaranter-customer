import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/detail_ads/controller_detail_ads.dart';
import 'package:intake_customer/framework/api1.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/others/show_dialog.dart';
import 'package:intake_customer/shared/widgets/pages/page_decoration_top.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageDetailAds extends GetView<ControllerDetailAds> {
  const PageDetailAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageDecorationTop(
      padding: EdgeInsets.zero,
      backgroundColor: AppColor.bgPageColor,
      toolbarColor: AppColor.whiteColor,
      toolbarTitleColor: AppColor.primaryColor,
      toolbarElevation: 2,
      center: null,
      title: "DETAIL IKLAN",
      enableBack: true,
      toolbarAction: [
        IconButton(
          onPressed: () async {
            controller.webViewcontroller.reload();
          },
          icon: const Icon(
            CupertinoIcons.refresh,
            color: AppColor.primaryColor,
          ),
        ),
      ],
      child: Obx(
        () => Stack(
          children: [
            WebView(
              initialUrl: "${Api1().webUrl}ads/${controller.idAds}",
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress) {
                print("WebView is loading (progress : %)");
                if (progress < 99) {
                  controller.loading.value = true;
                } else {
                  // Get.snackbar("Selesai", "Berhasil memuat data...");
                  controller.loading.value = false;
                }
              },
              onWebViewCreated: (webController) {
                controller.webViewcontroller = webController;
              },
              navigationDelegate: (NavigationRequest request) async {
                if (request.url.contains("tel:")) {
                  if (await canLaunch(request.url)) {
                    await launch(request.url);
                  } else {
                    showPopUpError(
                      errorMessage: "error open call ",
                      errorTitle: 'Terjadi kesalahan',
                    );
                  }
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
            controller.loading.isTrue
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: LinearProgressIndicator(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
