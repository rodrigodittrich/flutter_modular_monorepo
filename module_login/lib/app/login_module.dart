import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:module_login/app/view/login_view.dart';

class LoginModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginView()),
  ];
}