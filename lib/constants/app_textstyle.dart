import 'package:flutter/material.dart';
import 'package:retensi_bloc/constants/app_colors.dart';
import 'package:retensi_bloc/constants/app_size.dart';

class AppTextStyle {
  static TextStyle mediumBlackText = TextStyle(
      color: Colors.black,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont
  );

  static TextStyle mediumWhiteText = TextStyle(
      color: Colors.white,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont
  );

  static TextStyle mediumBlackBoldText = TextStyle(
      color: Colors.black,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont,
      fontWeight: FontWeight.bold
  );

  static TextStyle mediumWhiteBoldText = TextStyle(
      color: Colors.white,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont,
      fontWeight: FontWeight.bold
  );

  static TextStyle mediumRedText = TextStyle(
      color: AppColor.red,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont
  );

  static TextStyle buttonLargeBlackText = TextStyle(
    color: Colors.black,
    fontFamily: "ProximaNova",
    fontSize: FontSize.largeFont,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mediumHintText = TextStyle(
    color: AppColor.shadowColor,
    fontFamily: "ProximaNova",
    fontSize: FontSize.mediumFont,
  );

  static TextStyle mediumBlueText = TextStyle(
      color: Colors.blue,
      fontFamily: "ProximaNova",
      fontSize: FontSize.mediumFont,
      decoration: TextDecoration.underline
  );

  static TextStyle headerLogoAppNameText = TextStyle(
      color: AppColor.blueColor,
      fontFamily: "sans-serif",
      fontSize: FontSize.headerFont,
      fontWeight: FontWeight.bold
  );

}