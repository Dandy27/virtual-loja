import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/commom/price_card.dart';
import 'package:virtualloja_app/models/cart_manager.dart';

import 'components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __){
          return ListView(
            children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cartManager.items.map(
              (cartProduct) => CartTile(cartProduct)).toList(),
          ),
              PriceCard(
                buttonText: 'Continuar para Entrega',
                onPressed: cartManager.isCartValid ? (){

                } : null,
              ),
            ],
          );
        },
      ),
    );
  }
}
