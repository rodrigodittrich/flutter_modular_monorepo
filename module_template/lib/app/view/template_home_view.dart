import 'package:commons/commons.dart';
import 'package:commons/shared/custom_container_button.dart';
import 'package:flutter/material.dart';
import 'template_view.dart';

class TemplateHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(title: "MODELO HOME DE UM MODULO"),
      //drawer: DrawerScreen(),
      body: Stack(
        children: [
          Container(
            height: Defaults.getDeviceHeight(context),
            color: Defaults.primaryColor,
          ),
          HeaderWidget(username: "User"),
          _content(context)
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: (Defaults.getDeviceHeight(context) * Defaults.percentHeightContentHome) - Defaults.getStatusBarHeight(context),
          width: (Defaults.getDeviceWidth(context)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Defaults.contentBorderRadius),
              topRight: Radius.circular(Defaults.contentBorderRadius),
            ),
            color: Defaults.contentBackGroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Defaults.contentPaddingVertical, horizontal: Defaults.contentPaddingHorizontal),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _botoes(context)
              ],
            )
          )
      ),
    );
  }

  Widget _botoes(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomContainerButton(
            text: "View 1",
            buttonRetalgle: true,
            function: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TemplateView())
              );
            },
          ),
          CustomContainerButton(
            text: "View 2",
            buttonRetalgle: true,
          )
        ],
      );
  }
}