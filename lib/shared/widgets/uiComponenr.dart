import 'package:flutter/material.dart';

class uiComponent{

  edtField(var edtController, {Icon? prefIcon}){
    return TextField(
      controller: edtController,
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

}