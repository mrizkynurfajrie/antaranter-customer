import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';
import 'package:intake_customer/shared/widgets/uiComponenr.dart';

class PageAboutApp extends StatelessWidget {
  const PageAboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      appBar: AppBar(
        title: const Text(
          'Tetang Aplikasi',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        foregroundColor: AppColor.primaryColor.shade300,
        backgroundColor: AppColor.whiteColor,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 70,
              width: 220,
              child: const Image(
                image: AssetImage('assets/logo/AntarAnter-Text-Only.png'),
              ),
            ),
          ),
          uiComponent().baseLineDarkColor(context),
          Center(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'Aplikasi dirancang untuk mempermudah pelanggan menemukan jasa transportasi serta informasi kepada pelanggan tentang pemenuhan data jasa tersebut.\n\nMelalui aplikasi, Pelanggan dan mitra Driver akan dihubungkan untuk memenuhi layanan pada aplikasi',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
