import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vocap_notes/view/style/app_color.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      //
      scaffoldBackgroundColor: AppColor.black,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColor.black,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.white,
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: AppColor.white,
        ),
      ),
    );
  }
}
