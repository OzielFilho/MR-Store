import 'package:flutter/material.dart';

class Compras {
  final String nomeProduto;
  final double valorProduto;
  final String urlImageProduto;
  
  Compras({@required this.nomeProduto, @required this.valorProduto, @required this.urlImageProduto})
      : assert(nomeProduto != null,
            throw Exception("Nome do produto nao pode ser nulo")),
        assert(urlImageProduto != null,
            throw Exception("Url da imagem do produto nao pode ser nulo")),
        assert(valorProduto != null,
            throw Exception("Valor do produto nao pode ser nulo"));
}


