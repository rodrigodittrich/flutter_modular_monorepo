import 'package:commons/shared/app_defaults.dart';
import 'package:flutter/material.dart';

class AppBarWidget {
  static getAppBar({required String title, Widget? action, Widget? leading}) {
    return AppBar(
      title: Text(title, style: TextStyle(fontSize: 16)),
      centerTitle: true,
      actions: action != null ? <Widget>[action] : [],
      leading: leading,
      elevation: 0,
      backgroundColor: Defaults.primaryColor,
    );
  }

  static getAppBarHeight() {
    return AppBar().preferredSize.height;
  }
}
