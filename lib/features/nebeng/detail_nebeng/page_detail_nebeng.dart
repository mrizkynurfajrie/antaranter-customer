import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intake_customer/features/nebeng/detail_nebeng/controller_detail_nebeng.dart';

class PageDetailNebeng extends GetView<ControllerDetailNebeng> {
  const PageDetailNebeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Detail nebeng ya sayang ya"),
      ),
    );
  }
}
