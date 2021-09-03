import '../commons.dart';
import 'package:flutter/material.dart';

class CustomContainerButton extends StatelessWidget {
  final String? text;
  final double fontSize;
  final FontWeight fontWeight;
  final IconData? icon;
  final double iconSize;
  final Color? backGroundColor;
  final Color? color;
  final Function? function;
  final double percentualHeight;
  final double percentualWidth;
  final Color? borderColor;
  final Image? image;
  final bool buttonRetalgle;
  final bool centralize;
  final bool boxShadow;
  final double padding;
  final MainAxisAlignment mainAxisAlignment;

  CustomContainerButton({
    @required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.bold,
    this.icon,
    this.iconSize=40,
    this.backGroundColor = Defaults.primaryColor,
    this.color = Colors.white,
    this.function,
    this.percentualHeight = Defaults.percentHeightNavigationBar - 0.02,
    this.percentualWidth = 0.3611,
    this.borderColor = Defaults.primaryColor,
    this.image,
    this.buttonRetalgle = false,
    this.centralize = false,
    this.boxShadow = true,
    this.padding = 10,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: buttonRetalgle ? (Defaults.getDeviceHeight(context) * percentualHeight) : (Defaults.getDeviceWidth(context) * percentualWidth),
        width: (Defaults.getDeviceWidth(context) * percentualWidth),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.all(
              Radius.circular(10),
          ),
          color: backGroundColor,
          boxShadow: boxShadow ? [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(-3, 3),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ] : [],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: centralize ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              centralize ?
              Center(
                child: image ??
                 Icon(icon, size: iconSize, color: color),
              ) : image ?? Icon(icon, size: iconSize, color: color),
              FittedBox(
                child: Text(
                  text!,
                  style: TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: function as void Function()?,
    );
  }
}
