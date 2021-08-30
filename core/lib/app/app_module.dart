import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_home/app/home_module.dart';
import 'package:module_login/app/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}