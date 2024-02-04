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

  static RoundedRectangleBorder roundedRectangleCorner({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0
  }) => RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
      )
  );

}
