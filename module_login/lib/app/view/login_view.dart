import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';

class LoginView  extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen"),),
      body: Container(
        color: Colors.green,
        child: GestureDetector(
          child: Center(
            child: Container(
              color: Colors.blue[500],
              child: Text("Login"),
            ),
          ),
          onTap: () {
            print("Login");
            Modular.to.navigate('/home');
          },
        ),
      ),      
    );
  }
}