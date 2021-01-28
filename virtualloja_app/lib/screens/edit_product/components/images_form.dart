import 'package:flutter/material.dart';
import 'package:virtualloja_app/models/product.dart';

class ImagesForm extends StatelessWidget {

  const ImagesForm(this.product);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return FormField<List<dynamic>>(
    initialValue: product.images,
      builder: (state){

      },
    );
  }
}
