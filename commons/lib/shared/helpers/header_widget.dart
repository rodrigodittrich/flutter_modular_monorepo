import 'app_bar_widget.dart';
import 'package:commons/shared/app_defaults.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final bool allowLogout;
  final double percentHeight;
  final Function? function;

  HeaderWidget({this.allowLogout = false, this.percentHeight = Defaults.percentHeightHeader, this.function});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final statusBarHeight = Defaults.getStatusBarHeight(context);
    final appBarHeight = AppBarWidget.getAppBarHeight();
    return Container(
      height: (height * percentHeight) - appBarHeight - statusBarHeight,
      color: Defaults.primaryColor,
      //User
      child: Center(
        child: Container(
          height: height * 0.0625,
          width: MediaQuery.of(context).size.width * 0.8278,
          color: Defaults.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, size: 40, color: Colors.white),
              Flexible(
                fit: FlexFit.loose,
                child: FittedBox(
                  child: Text(
                    "User Name",
                    style: TextStyle(fontSize: 28, color: Colors.white, fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              allowLogout ?
              GestureDetector(
                child: Icon(Icons.power_settings_new, size: 40, color: Colors.white),
                onTap: function as void Function()?
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}