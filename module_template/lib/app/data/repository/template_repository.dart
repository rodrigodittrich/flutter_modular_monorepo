import '../model/template.dart';

class TemplateRepository {

  Future<Template> getCount() async {
    final response = {"count": 10};
    final template = Template.fromJson(response);
    return template;
  }

}