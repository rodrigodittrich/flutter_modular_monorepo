import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:module_counter/app/counter_module.dart';
import 'package:module_home/app/home_module.dart';
import 'package:module_login/app/login_module.dart';
import 'package:module_template/app/template_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/Modulo1', module: TemplateModule()),
    ModuleRoute('/Modulo2', module: TemplateModule()),
    ModuleRoute('/Modulo3', module: TemplateModule()),
    ModuleRoute('/Template', module: TemplateModule()),
    ModuleRoute('/Template', module: CounterModule()),
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}