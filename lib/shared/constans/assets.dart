import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/styles.dart';


class AppIcons {
  static const boxOrange = 'assets/icons/box-orange.png';
  static const historyOrder = 'assets/icons/history-order.png';
  static const customerService = 'assets/icons/customer-service.png';
  static const locationIn = 'assets/icons/location-in.png';
  static const locationTake = 'assets/icons/location-take.png';
}
class AppLogos {
  static const logoColored = 'assets/logo/logo-besar.png';

  static Widget logoAppBar(String asset) {
    return Image.asset(
      asset,
      height: IconSizes.xl,
    );
  }
}
