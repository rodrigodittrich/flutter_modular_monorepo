import 'package:commons_dependencies/commons_dependencies.dart';

class CounterController extends Disposable {

  final _counterController = BehaviorSubject<int?>();
  Stream<int?> get counterOut => _counterController.stream;
  int? counter = 10;

  CounterController() {
    _counterController.add(counter);
  }

  void setCount(int value) {
    _counterController.add(value);
  }

  @override
  void dispose() {
    _counterController.close();
  }

}