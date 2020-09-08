import 'package:flutter/material.dart';
import 'package:mrstore/model/compras.dart';

class ComprasController extends ChangeNotifier {
  String nomeProduto = "";
  double precoProduto = 0;
  String imagemProduto = "";
  List<Compras> compras = [];
  setCompras(Compras compra) {
    
    compras.add(compra);
    notifyListeners();
  }
}