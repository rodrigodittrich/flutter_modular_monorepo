import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Defaults {
  static const Color primaryColor = Color.fromARGB(255, 1, 70, 114);
  static const Color navigationBarColor = Colors.white;
  static const Color contentBackGroundColor = Colors.white;
  static const Color appBarTextColor = Colors.white;

  static double getDeviceHeight(context) => MediaQuery.of(context).size.height;

  static double getDeviceWidth(context) => MediaQuery.of(context).size.width;

  static double getStatusBarHeight(context) => MediaQuery.of(context).padding.top;

  static const double percentHeightNavigationBar = 0.15;

  static const double percentHeightHeader = 0.1875;

  static const double percentHeightContent = 1 - percentHeightNavigationBar - percentHeightHeader;

  static const double percentHeightContentHome = 1 - percentHeightHeader;

  static const double contentBorderRadius = 30.0;

  static const double contentPaddingVertical = 10.0;

  static const double contentPaddingHorizontal = 10.0;

  static List<IconData> menuIcons = [
    Icons.question_answer,
    Icons.list,
    Icons.inventory,
    Icons.money,
    Icons.list,
    Icons.list,
    Icons.list,
  ];
}