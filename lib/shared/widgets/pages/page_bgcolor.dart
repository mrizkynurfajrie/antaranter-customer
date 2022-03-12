import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/colors.dart';


class PageBgColor extends StatelessWidget {
  final Widget child;
  final Color? colorse;

  const PageBgColor({Key? key, required this.child, this.colorse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorse ?? AppColor.bgPageColor,
        body: SafeArea(child: child));
  }
}
