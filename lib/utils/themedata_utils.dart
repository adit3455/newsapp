import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'export_utils.dart';

class ThemeDataChanger {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: Colors.black87, size: 25.0, shadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),

          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      backgroundColor: AppUtils.lightBackgroundColor,
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppUtils.lightBackgroundColor,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: Colors.white70, size: 25.0, shadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      backgroundColor: AppUtils.darkBackgroundColor,
    ),
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Colors.white),
    primarySwatch: Colors.purple,
    scaffoldBackgroundColor: AppUtils.darkBackgroundColor,
  );
}
