import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class PaginaController extends Disposable {

  final _pageIndexController = BehaviorSubject<int?>();
  Stream<int?> get pageIndex => _pageIndexController.stream;
  int? get page => _pageIndexController.stream.value!;

  PageController? pageController = PageController(initialPage: 0);

  PaginaController() {
    _pageIndexController.add(0);
  }

  void setPageIndex(int index) {
    _pageIndexController.add(index);
  }

  @override
  void dispose() {
    _pageIndexController.close();
    pageController!.dispose();
  }

}