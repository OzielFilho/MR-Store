import 'package:flutter/material.dart';
import 'package:mrstore/model/produto.dart';

class ProdutoController extends ChangeNotifier {
  String nomeProduto = "";
  double precoProduto = 0;
  String imagemProduto = "";
  List<Produto> produtos = [];
  setProduto(Produto produto) {
    debugPrint(produto.nomeProduto);
    debugPrint(produto.valorProduto.toString());
    debugPrint(produto.urlImageProduto);
    produtos.add(produto);
    notifyListeners();
  }
}
