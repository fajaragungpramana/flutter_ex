import 'package:flutter/cupertino.dart';
import 'package:flutter_ex/resources/values/app_color.dart';

class AppStyle {
  AppStyle._();

  static TextStyle textRegular(
          {double fontSize = 14, color = AppColor.black100}) =>
      TextStyle(fontFamily: 'Poppins', fontSize: fontSize, color: color);

  static TextStyle textSemiBold(
          {double fontSize = 20, color = AppColor.black100}) =>
      TextStyle(
          fontFamily: 'Poppins',
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: color);
}
