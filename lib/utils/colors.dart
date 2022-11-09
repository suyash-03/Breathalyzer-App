import 'dart:ui';

import 'package:flutter/material.dart';

extension colorExt on String {
  Color fromHexToColor() {
    var hexColor = this.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Color.fromRGBO(0, 0, 0, 0);
  }
}

/// Colors
@Deprecated('Use \`#00000\`.fromHexToColor() instead')
class HexColor extends Color {
  /// Colors
  HexColor(final String hexColor) : super(getColorFromHex(hexColor));

  /// Colors from Hex
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

class BrandColor {
  static const Color drawerBackgroundColor = Color(0xff111416);
  static const Color unselectedDrawerTextColor = Color(0xff6B7378);
  static const Color logoutButtonColor = Color(0xff1E2326);

  static const Color outerStrokeProfileBorderColor = Color(0xff794FFF);
  static const Color innerStrokeProfileBorderColor = Color(0xffFF42DE);

  // Food Screen
  static const Color homeBackgroundColor = Color(0xff111416);
  static const Color foodsearchViewTextColor = Color(0xff6B7378);
  static const Color foodBlockPinklight = Color(0xffFF9DF4);
  static const Color foodBlockPinkDark = Color(0xffFF42DE);
  static const Color foodBlockBluelight = Color(0xff99D6FF);
  static const Color foodBlockBlueDark = Color(0xff1E99F1);
  static const Color foodBlockVioletlight = Color(0xff8738E9);
  static const Color foodBlockVioletDark = Color(0xff654EFE);
  static const Color foodVendorCardColor = Color(0xff1E2326);
  static const Color foodCartCheckoutBacground = Color(0xff0D0D0D);
  static const Color checkoutButtonColor = Color(0xff8DFF8F);
  static const Color checkoutBtnDark = Color(0xff2DDC5F);
  static const Color foodCheckoutTileColor = Color(0xff1E2326);
  static const Color categoriesBtnTextcolor = Color(0xff6B7378);

  // signings and misc
  static const Color unselectedContainerColor = Color(0xff1E2326);
  //cabs screen colors
  static const Color tabIndicatorColor = Color(0xffFDAF31);
  static const Color circularIconGradientColor1 = Color(0xffF0D57C);
  static const Color circularIconGradientColor2 = Color(0xffF48742);
  static const Color nonActivePageIndicator = Color(0xff4C5773);
  static const Color activePageIndicator = Color(0xff48EBA7);
  static const Color details_page_heading_color = Color(0xff878787);

  static const Color currentSigningVioletDark = Color(0xff654EFE);
  static const Color currentSigningVioletLight = Color(0xff8738E9);
  static const Color pastSigningPinkDark = Color(0xff8838E7);
  static const Color pastSigningPinkLight = Color(0xffF568D8);
  static const Color newsLetterBlockColor = Color(0xff1e2326);
  static const Color representativeGrad1 = Color(0xff5592FC);
  static const Color representativeGrad2 = Color(0xff5A65FD);

  static const Color cordSubTextColor = Color(0XffBCBCBC);
  static const Color cordScreenGreyText = Color(0xff666666);
  static const Color cordBlueShade = Color(0xff5A68FD);

  static const Color placeOrderDialogBackground = Color(0xff353637);
}