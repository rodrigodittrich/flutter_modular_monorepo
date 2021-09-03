import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:module_home/app/domain/controller/modulo_controller.dart';
import 'package:module_home/app/domain/controller/pagina_controller.dart';
import 'view/home_view.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ModuloController()),
    Bind.singleton((i) => PaginaController()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomeView()),
  ];
}