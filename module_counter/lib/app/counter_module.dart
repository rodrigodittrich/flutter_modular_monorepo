import 'package:commons_dependencies/commons_dependencies.dart';
import 'domain/controller/counter_controller.dart';
import 'view/counter_view.dart';

class CounterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CounterController()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CounterView()),
  ];
}