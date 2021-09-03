import 'package:commons_dependencies/commons_dependencies.dart';
import 'domain/controller/template_controller.dart';
import 'view/template_home_view.dart';

class TemplateModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => TemplateController()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => TemplateHomeView()),
  ];
}