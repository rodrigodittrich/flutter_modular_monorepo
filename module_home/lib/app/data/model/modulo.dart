class Modulo{
  String? nome;

  Modulo({
    this.nome,
  });

  factory Modulo.fromJson(Map<String, dynamic> map) {
    return new Modulo(
      nome: map['nome'],
    );
  }

}