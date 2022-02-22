import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageCreateOrder extends StatelessWidget {
  const PageCreateOrder({Key? key}) : super(key: key);

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
                width: 250,
                child: Image.asset(
                  "assets/logo/logo-besar.png",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 40,
                    height: 40,
                    child: Image.asset("assets/icons/directions_bike_grey.png"),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sudah ada barang yang dikirim?",
                          style: TextStyle(color: Color(0xFF787878)),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
