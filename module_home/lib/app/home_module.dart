import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_home/app/view/home_view.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomeView()),
  ];
}