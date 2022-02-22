import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgPageColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                width: 300,
                child: Image.asset(
                  "assets/logo/logo-besar.png",
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Text(
                  "Ingin kirim apa hari ini?",
                  style: TextStyle(
                    color: AppColor.textColorGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ]),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 180,
                            width: Get.width,
                            child: Image.asset(
                              "assets/images/demo-pict.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kacang Almond Booster",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColor.primaryColor.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "081234567890",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Kacang almond merupakan sumber protein terbaik bagi ibu menyusui. Bahkan ginekolog merekomendasikan untuk rutin mengkonsumsi kacang almond saat menyusui, karena kacang almond kaya akan kalsium dan secara efektif dapat meningkatkatkan proses pertumbuhan bayi ibu.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
