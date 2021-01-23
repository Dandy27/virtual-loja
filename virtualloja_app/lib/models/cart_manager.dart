import 'package:virtualloja_app/models/cart_product.dart';
import 'package:virtualloja_app/models/product.dart';

class CartManager {

  List<CartProduct> items = [];

  void addToCart(Product product){
    items.add(CartProduct.fromProduct(product));
  }

}