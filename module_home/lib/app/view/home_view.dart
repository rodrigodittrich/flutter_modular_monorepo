import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import 'drawer_screen.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppBar(title: "Home View"),
      drawer: DrawerScreen(),
      //bottomNavigationBar: NavigationScreen(),
      body: Container(
        child: Column(
          children: [
            HeaderWidget(allowLogout: true, function: _logout, username: "User"),
          ],
        ),
      ) //PageList(),
    );
  }

  void _logout() {
    Modular.to.navigate('/login');
  }

}