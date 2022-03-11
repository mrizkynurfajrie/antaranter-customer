import 'package:flutter/material.dart';
import 'package:intake_customer/shared/constans/styles.dart';

class AppIcons {
  static const boxOrange = 'assets/icons/box-orange.png';
  static const historyOrder = 'assets/icons/history-order.png';
  static const customerService = 'assets/icons/customer-service.png';
  static const locationIn = 'assets/icons/location-in.png';
  static const locationTake = 'assets/icons/location-take.png';
  static const locationStart = 'assets/icons/location-start.png';
  static const titipIcon = 'assets/icons/titip-icon.png';
  static const kurirIcon = 'assets/icons/kurir-icon.png';
  static const nebengIcon = 'assets/icons/nebeng-icon.png';
  static const historyIcon = 'assets/icons/history-icon.png';
  static const termsIcon = 'assets/icons/terms-icon.png';
  static const seat = 'assets/icons/seat.png';
  static const minivan = 'assets/icons/minivan.png';
  static const priceTag = 'assets/icons/price-tag.png';

  static Widget smallIcon(String asset, {double? size}) {
    return Image.asset(
      asset,
      height: size?? IconSizes.sm,
    );
  }
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
