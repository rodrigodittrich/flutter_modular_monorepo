import 'package:commons/main.dart';
import 'package:commons_dependencies/main.dart';
import 'package:flutter/material.dart';

class HomeView  extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Stack(
        children: [
          HeaderWidget(allowLogout: true, function: _logout)
        ],
      ),      
    );
  }

  void _logout() {
    Modular.to.navigate('/login');
  }
}
