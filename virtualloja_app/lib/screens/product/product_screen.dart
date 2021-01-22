import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/product.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen(this.product);

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Carousel(
              images: product.images.map((url) {
                return NetworkImage(url);
              }).toList(),
              // dotSize: 4,
              dotSpacing: 15,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('A partir de',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13
                  ),)
                ),
                Text('R\$ 29.99',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
