import 'package:flutter/material.dart';

class Pessoa {
  final String nome;
  final String email;
  Pessoa({@required this.nome, @required this.email})
      : assert(nome != null, throw Exception("Nome nao pode ser nulo")),
        assert(email != null, throw Exception("Email nao pode ser nulo"));
}
