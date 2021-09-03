class Template {
  int? count;

  Template({
    this.count,
  });

  factory Template.fromJson(Map<String, dynamic> map) {
    return new Template(
      count: map['count'],
    );
  }

}