import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class uiComponent{

  baseBackgroundColor(BuildContext context){
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xfff5f5f5)
    );
  }

  baseLineDarkColor(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 2,
      width: MediaQuery.of(context).size.width * 0.9,
      color: AppColor.bodyColor.shade400,
    );
}

  baseLinePrimaryColor(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 5),
      height: 2,
      width: MediaQuery.of(context).size.width * 0.25,
      color: AppColor.primaryColor.shade300,
    );
}

  edtField(var edtController, String edtname, {Icon? prefIcon}){
    return TextField(
      controller: edtController,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 15, right: 20),
          hintText: edtname,
          prefixIcon: prefIcon
      ),
    );
  }

  edtPassField(var edtController, {Icon? prefIcon}){
    return TextField(
      controller: edtController,
      obscureText: true,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 15, right: 20),
          hintText: 'Password',
          prefixIcon: prefIcon
      ),
    );
  }

  buttonStyle_one(String buttonName, BuildContext buttonContext, Color buttonColor, var buttonFuction) {
    return ElevatedButton(
        onPressed: buttonFuction,
        style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            elevation: 4,
            fixedSize: Size(MediaQuery.of(buttonContext).size.width, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            primary: buttonColor),
        child: Text(buttonName));
  }

  boxWhite(BuildContext context, Widget item){
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: item,
    );
  }
}