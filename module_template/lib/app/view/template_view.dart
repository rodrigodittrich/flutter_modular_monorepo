import 'package:commons/commons.dart';
import 'package:commons/shared/custom_container_button.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import '../domain/controller/template_controller.dart';
import '../data/model/template.dart';

class TemplateView extends StatelessWidget {
  final _templateControler = Modular.get<TemplateController>();

  @override
  Widget build(BuildContext context) {
    _templateControler.getCount();

    return Scaffold(
      appBar: AppBarWidget.getAppBar(title: "MODELO DE VIEW"),
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
      bottomNavigationBar: Container(
        height: (Defaults.getDeviceHeight(context) * Defaults.percentHeightNavigationBar),
        color: Defaults.navigationBarColor,
        child: _botoes(context)
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: (Defaults.getDeviceHeight(context) * Defaults.percentHeightContent) - Defaults.getStatusBarHeight(context),
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
            child: ListView(
              children: [
                Container(
                  height: 100,
                  child: Card(
                    color: Colors.grey[300],
                    child: Text("Counteúdo 1"),
                  ),
                ),
                Container(
                  height: 100,
                  child: Card(
                    color: Colors.grey[300],
                    child: Text("Counteúdo 2"),
                  ),
                ),
                StreamBuilder<Template?>(
                  stream: _templateControler.templateOut,
                  builder: (context, template) {
                    if (!template.hasData) return Container();
                    return Container(
                      height: 100,
                      child: Card(
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            template.data!.count.toString(),
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
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
            text: "Aumentar",
            function: () {
              _templateControler.template.count = _templateControler.template.count! + 1;
              _templateControler.setCount(_templateControler.template);
            },
            buttonRetalgle: true,
          ),
          CustomContainerButton(
            text: "Diminuir",
            function: () {
              _templateControler.template.count = _templateControler.template.count! - 1;
              _templateControler.setCount(_templateControler.template);
            },
            buttonRetalgle: true,
          )
        ],
      );
  }
}