import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/temcondition/controller_termcondition.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageTermCondition extends StatelessWidget {
  const PageTermCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pg = Get.put(ControllerTermCondition());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Term & Condition', style: TextStyle(fontWeight: FontWeight.w600),),
        foregroundColor: AppColor.primaryColor.shade300,
        backgroundColor: AppColor.whiteColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: Get.height,
            width: Get.width,
            color: AppColor.bgPageColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: Get.height,
            width: Get.width,
            child: PageView(
              controller: pg.pageControl,
              children: [
                term(),
                condition()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class term extends StatelessWidget {
  const term({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: Get.height,
            width:  Get.width,
            color: AppColor.bgPageColor,
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: Icon(
                  CupertinoIcons.doc_fill,
                  size: 50,
                  color: AppColor.primaryColor.shade300,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Syarat Pengguna',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primaryColor.shade300,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: Get.width * 0.8,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                          child: Text(
                              '1. Pastikan nomor ponsel anda adalah nomor ponsel aktif yang dapat dihubungi untuk mempermudah proses layanan yang telah kami sediakan kepada anda',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                          child: Text(
                              '2. Demi melindungi & menjaga kenyamana semua pihak, harap sertakan data diri anda berupa KTP dan Nomor Induk Kependudukan anda agar dapat memastikan bahwa setiap pesanan yang dilakukan datang dari pihak yang bertanggung jawab',
                            textAlign: TextAlign.justify,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class condition extends StatelessWidget {
  const condition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: Get.height,
            width:  Get.width,
            color: AppColor.bgPageColor,
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20),
                child: Icon(
                  CupertinoIcons.doc_fill,
                  size: 50,
                  color: AppColor.primaryColor.shade300,
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Kondisi Pengguna',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor.shade300,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: Get.width * 0.8,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '1. Dilarang memberikan/ menerima tawaran offline kurir in-take',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '2. Pemesanan hanya diperbolehkan melalui aplikasi in-take',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '3. Aktivitas pemesanan diluar aplikasi in-take bukan tanggung jawab pihak PT. Indo Tekno Karya',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '4. Pastikan identitas rider ketika rider terima barang',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '5. Pastikan pembeli anda tidak melakukan usaha penipuan dan dapat dipastikan ada ditempat',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '6. Jika barang kembali karena perihal penipuan/ penerima tidak ditempat, talangan rider dikembalikan + GANTI ONGKIR KURIR BOLAK BALIK',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: Text(
                            '7. Poin diatas dapat dilakukan jika pembeli dlam waktu 1x24 jam tidak ada respon',
                            textAlign: TextAlign.justify,
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                          child: Text(
                            '8. Batas waktu nego adalah 3 menit per 1 pemesanan, jika melampaui maka akan otomatis dibatalkan oleh sistem',
                            textAlign: TextAlign.justify,
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


