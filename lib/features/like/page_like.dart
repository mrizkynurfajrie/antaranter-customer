import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/like/controller_like.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageLike extends GetView<ControllerLike>{
  const PageLike({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Kiriman Favorit', style: TextStyle(fontWeight: FontWeight.w600),),
          foregroundColor: AppColor.primaryColor.shade300,
          backgroundColor: AppColor.whiteColor,
        ),
      );
}