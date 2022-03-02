import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/history/controller_history.dart';
import 'package:intake_customer/shared/constans/colors.dart';

class PageHistory extends GetView<ControllerHistory>{
  const PageHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat Pesanan', style: TextStyle(fontWeight: FontWeight.w600),),
          foregroundColor: AppColor.primaryColor.shade300,
          backgroundColor: AppColor.whiteColor,
        ),
      );
}