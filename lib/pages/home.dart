import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mrstore/controllers/compras_controller.dart';
import 'package:mrstore/controllers/name_email_controller.dart';
import 'package:mrstore/controllers/produto_controller.dart';
import 'package:mrstore/model/compras.dart';
import 'package:mrstore/model/pessoa.dart';
import 'package:mrstore/model/produto.dart';
import 'package:mrstore/pages/carrinho.dart';
import 'package:mrstore/pages/conta.dart';
import 'package:mrstore/pages/suasCompras.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final String id = "home-page";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final design1 = TextStyle(color: Colors.white, fontFamily: 'Pacifico');
  final design2 = TextStyle(color: Color(0xff68a3ac), fontFamily: 'Pacifico');
  final corAnuncio = TextStyle(color: Colors.black, fontFamily: 'Ostrich');

  List<int> preco = [];
  _gerarPreco() {
    var rand = Random();
    for (var i = 0; i < 10; i++) {
      setState(() {
        preco.add(rand.nextInt(40) + 20);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _gerarPreco();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Bem vindo(a)",
                      style: design1,
                    ),
                    CircleAvatar(
                      radius: 53,
                      backgroundColor: Color(0xff68a3ac),
                      child: Image.asset("images/LOGO.png"),
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(color: Color(0xff68a3ac)),
            ),
            ListTile(
              title: Text(
                "Sua Conta",
                style: design2,
              ),
              onTap: () {
                Navigator.pushNamed(context, Conta.id);
              },
            ),
            ListTile(
              title: Text(
                "Suas Compras",
                style: design2,
              ),
              onTap: () {
                for (var i = 0; i < 5; i++) {
                  final compras = Compras(
                      nomeProduto: "Short ${i + 1}",
                      valorProduto: preco[i].toDouble(),
                      urlImageProduto:
                          'https://cea.vteximg.com.br/arquivos/ids/10347776/Short-Jeans-Infantil-Destroyed-Azul-Claro-9624830-Azul_Claro_1.jpg?v=636988166157400000');
                  Provider.of<ComprasController>(context, listen: false)
                      .setCompras(compras);
                }

                Navigator.pushNamed(context, SuasCompras.id);
              },
            ),
            ListTile(
              title: Text(
                "Carrinho",
                style: design2,
              ),
              onTap: () {
                Navigator.pushNamed(context, Carrinho.id);
              },
            ),
            ListTile(
              title: Text("Categorias", style: design2),
              onTap: () {},
            ),
            ListTile(
              title: Text("Sobre nós", style: design2),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff68a3ac),
        title: Text("MR store", style: design1),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Vestidos",
                    style: design2,
                    textAlign: TextAlign.left,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                  ),
                  child: ListView.builder(
                    // Deve retornar as 5 músicas escutadas recentemente
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://images.tcdn.com.br/img/img_prod/502252/vestido_florido_com_recorte_maria_amore_1711_1_20190218101513.jpeg',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  final produto = Produto(
                                      nomeProduto: 'Vestido ${index + 1}',
                                      valorProduto: preco[index].toDouble(),
                                      urlImageProduto:
                                          'https://images.tcdn.com.br/img/img_prod/502252/vestido_florido_com_recorte_maria_amore_1711_1_20190218101513.jpeg');

                                  Provider.of<ProdutoController>(context,
                                          listen: false)
                                      .setProduto(produto);
                                  Navigator.pushNamed(context, Carrinho.id);
                                },
                                child: Column(
                                  children: [
                                    Text('Vestido ${index + 1}',
                                        overflow: TextOverflow.ellipsis,
                                        style: corAnuncio),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('R\$ ${preco[index]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: corAnuncio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Calças",
                    style: design2,
                    textAlign: TextAlign.left,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                    maxWidth: 50.0,
                  ),
                  child: ListView.builder(
                    // Deve retornar as 5 músicas escutadas recentemente
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://images.tcdn.com.br/img/img_prod/371269/calca_jeans_feminina_azul_claro_calvin_klein_5949_1_20190325103924.jpg',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  final produto = Produto(
                                      nomeProduto: 'Calca jeans ${index + 1}',
                                      valorProduto: preco[index].toDouble(),
                                      urlImageProduto:
                                          'https://images.tcdn.com.br/img/img_prod/371269/calca_jeans_feminina_azul_claro_calvin_klein_5949_1_20190325103924.jpg');

                                  Provider.of<ProdutoController>(context,
                                          listen: false)
                                      .setProduto(produto);
                                  Navigator.pushNamed(context, Carrinho.id);
                                },
                                child: Column(
                                  children: [
                                    Text('Calca jeans ${index + 1}',
                                        overflow: TextOverflow.ellipsis,
                                        style: corAnuncio),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('R\$ ${preco[index]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: corAnuncio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Shorts",
                    style: design2,
                    textAlign: TextAlign.left,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                  ),
                  child: ListView.builder(
                    // Deve retornar as 5 músicas escutadas recentemente
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  'https://cea.vteximg.com.br/arquivos/ids/10347776/Short-Jeans-Infantil-Destroyed-Azul-Claro-9624830-Azul_Claro_1.jpg?v=636988166157400000',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  final produto = Produto(
                                      nomeProduto: 'Short jeans ${index + 1}',
                                      valorProduto: preco[index].toDouble(),
                                      urlImageProduto:
                                          'https://cea.vteximg.com.br/arquivos/ids/10347776/Short-Jeans-Infantil-Destroyed-Azul-Claro-9624830-Azul_Claro_1.jpg?v=636988166157400000');

                                  Provider.of<ProdutoController>(context,
                                          listen: false)
                                      .setProduto(produto);
                                  Navigator.pushNamed(context, Carrinho.id);
                                },
                                child: Column(
                                  children: [
                                    Text('Short jeans ${index + 1}',
                                        overflow: TextOverflow.ellipsis,
                                        style: corAnuncio),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('R\$ ${preco[index]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: corAnuncio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Excstasy",
                    style: design2,
                    textAlign: TextAlign.left,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200.0,
                  ),
                  child: ListView.builder(
                    // Deve retornar as 5 músicas escutadas recentemente
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/07/02/911663-red-buli-ecstasy-chennai.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: RaisedButton(
                                onPressed: () {
                                  final produto = Produto(
                                      nomeProduto: 'Short jeans ${index + 1}',
                                      valorProduto: preco[index].toDouble(),
                                      urlImageProduto:
                                          'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/07/02/911663-red-buli-ecstasy-chennai.jpg');

                                  Provider.of<ProdutoController>(context,
                                          listen: false)
                                      .setProduto(produto);
                                  Navigator.pushNamed(context, Carrinho.id);
                                },
                                child: Column(
                                  children: [
                                    Text('Short jeans ${index + 1}',
                                        overflow: TextOverflow.ellipsis,
                                        style: corAnuncio),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.0),
                                      child: Text('R\$ ${preco[index]}',
                                          overflow: TextOverflow.ellipsis,
                                          style: corAnuncio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
