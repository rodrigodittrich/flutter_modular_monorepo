import 'package:flutter/services.dart';
import 'dart:convert';
import '../model/modulo.dart';

class ModuloRepository {

  Future<List<Modulo>> getModulos() async {
    final response = await rootBundle.loadString("assets/database/modulos.json");
    final list = jsonDecode(response) as List;
    final modulos = list.map((e) => Modulo.fromJson(e)).toList();
    return modulos;
  }

}