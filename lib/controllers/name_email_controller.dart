import 'package:flutter/material.dart';
import 'package:mrstore/model/pessoa.dart';

class NameEmailController extends ChangeNotifier {
  String _nome = "null";
  String _email = "null";
  List<Pessoa> pessoas = [];
  setNameEmail(Pessoa pessoa) {
    debugPrint(pessoa.nome);
    debugPrint(pessoa.email);
    _email = pessoa.email;
    _nome = pessoa.nome;
    pessoas.add(pessoa);
    notifyListeners();
  }
}
