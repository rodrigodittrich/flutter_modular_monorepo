import 'package:commons_dependencies/commons_dependencies.dart';
import '../../data/model/modulo.dart';
import '../../data/repository/modulo_repository.dart';
import 'package:rxdart/rxdart.dart';

class ModuloController extends Disposable {

  List<Modulo> modulos = [];

  final repository = ModuloRepository();

  final _moduloController = BehaviorSubject<List<Modulo>?>();
  Stream<List<Modulo>?> get outModulos => _moduloController.stream;

  final _menuController = BehaviorSubject<int?>();
  Stream<int?> get menuIndex => _menuController.stream;
  int? get menu => _menuController.stream.value!;

  ModuloController() {
    _menuController.add(-1);
    _carregarModulos();
  }

  Future _carregarModulos() async {
    modulos = await repository.getModulos();
    _moduloController.add(modulos);
  }

  void setMenuIndex(int index) {
    _menuController.add(index);
  }

  @override
  void dispose() {
    _moduloController.close();
    _menuController.close();
  }
}