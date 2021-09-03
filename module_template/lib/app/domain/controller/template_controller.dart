import 'package:commons_dependencies/commons_dependencies.dart';
import '../../data/repository/template_repository.dart';
import '../../data/model/template.dart';
import 'package:rxdart/subjects.dart';

class TemplateController extends Disposable {

  final _templateController = BehaviorSubject<Template?>();
  Stream<Template?> get templateOut => _templateController.stream;

  final repository = TemplateRepository();

  Template template = Template();

  TemplateBloc() {
    getCount();
  }

  getCount() async {
    template = await repository.getCount();
    _templateController.add(template);
  }

  void setCount(Template value) {
    _templateController.add(value);
  }

  @override
  void dispose() {
    _templateController.close();
  }

}