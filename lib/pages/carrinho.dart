import 'package:flutter/material.dart';

import 'package:mrstore/controllers/produto_controller.dart';
import 'package:provider/provider.dart';

class Carrinho extends StatelessWidget {
  static final String id = "carrinho-page";
  final design1 = TextStyle(color: Colors.white, fontFamily: 'Pacifico');
  final designNomeAnuncio =
      TextStyle(color: Color(0xff68a3ac), fontSize: 20, fontFamily: 'Ostrich');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff68a3ac),
        title: Text(
          "Carrinho",
          style: design1,
        ),
      ),
      body: Consumer<ProdutoController>(
        builder: (context, value, _) => ListView.builder(
          itemCount: value.produtos.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(8.0),
                    width: double.infinity,
                    height: 150,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.network(
                                  value.produtos[index].urlImageProduto),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(left: 60.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.produtos[index].nomeProduto,
                                      style: designNomeAnuncio,
                                    ),
                                    Text(
                                      "R\$ " +
                                          value.produtos[index].valorProduto
                                              .toInt()
                                              .toString(),
                                      style: designNomeAnuncio,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: GestureDetector(
                                  onTap: () {
                                    //remover da lista
                                    value.produtos.removeAt(index);
                                  },
                                  child: Icon(Icons.delete)),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
