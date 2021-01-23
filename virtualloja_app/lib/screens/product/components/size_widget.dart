import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/item_size.dart';
import 'package:provider/provider.dart';
import 'package:virtualloja_app/models/product.dart';

class SizeWidget extends StatelessWidget {

 const SizeWidget({this.size});

  final ItemSize size;

  @override
  Widget build(BuildContext context) {

    print('build $size');

    final product = context.watch<Product>();
    final selected = size == product.selectedSize;

    Color color;
    if(!size.hasStock)
      color = Colors.red.withAlpha(50);
    else if(selected)
      color = Theme.of(context).primaryColor;
    else
      color = Colors.grey;

    return GestureDetector(
      onTap: (){
        product.selectedSize = size;
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min
          ,
          children: [
            Container(
                color: color,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                size.name,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('R\$ ${size.price.toStringAsFixed(2)}',
              style: TextStyle(
                  color: color
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
