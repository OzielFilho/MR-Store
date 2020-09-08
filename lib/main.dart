import 'package:flutter/material.dart';
import 'package:mrstore/controllers/compras_controller.dart';
import 'package:mrstore/controllers/name_email_controller.dart';
import 'package:mrstore/controllers/produto_controller.dart';

import 'package:mrstore/pages/carrinho.dart';
import 'package:mrstore/pages/conta.dart';

import 'package:mrstore/pages/home.dart';
import 'package:mrstore/pages/suasCompras.dart';
import 'package:provider/provider.dart';

void main() => runApp(Mrstore());

class Mrstore extends StatelessWidget {
  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NameEmailController>(
          create: (context) => NameEmailController(),
        ),
        ChangeNotifierProvider<ProdutoController>(
          create: (context) => ProdutoController(),
        ),
        ChangeNotifierProvider<ComprasController>(
          create: (context) => ComprasController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Home.id,
        routes: {
          Home.id: (context) => Home(),
          Carrinho.id: (context) => Carrinho(),
          Conta.id: (context) => Conta(),
          SuasCompras.id: (context) => SuasCompras(),
          
        },
      ),
    );
  }
}


