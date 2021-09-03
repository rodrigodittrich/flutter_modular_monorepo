import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/material.dart';
import '../domain/controller/counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterController = Modular.get<CounterController>();

    return Scaffold(
      appBar: AppBarWidget.getAppBar(title: "Template View"),
      body: Column(
        children: [
          HeaderWidget(allowLogout: true, function: _logout, username: "User"),
          SizedBox(height: 200,),
          StreamBuilder<int?>(
            stream: _counterController.counterOut,
            builder: (context, counter) {
              if (!counter.hasData) return Container();
              return Container(
                height: 100,
                child: Card(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      counter.data.toString(),
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              );
            }
          ),
          GestureDetector(
            child: Container(
              height: 50,
              width: 50,
              child: Text("+"),
              ),
            onTap: (){
              _counterController.counter = _counterController.counter! + 1;
              _counterController.setCount(_counterController.counter!);
            },
          ),

          GestureDetector(
            child: Container(
              height: 50,
              width: 50,
              child: Text("-"),
              ),
            onTap: (){
              _counterController.counter = _counterController.counter! - 1;
              _counterController.setCount(_counterController.counter!);
            },
          )

        ],
      ),      
    );
  }

  void _logout() {
    Modular.to.navigate('/login');
  }
}