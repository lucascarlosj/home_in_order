import 'package:flutter/material.dart';
import 'package:micro_design_system/micro_design_system.dart';

class HomeInOrderThemeConfig {
  HomeInOrderThemeConfig._();

  static String get title => 'Home in Order';

  static ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyles.title,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Urbanist',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, fontFamily: 'Urbanist'),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic, fontFamily: 'Urbanist'), 
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Urbanist'),
        ),
      );
}