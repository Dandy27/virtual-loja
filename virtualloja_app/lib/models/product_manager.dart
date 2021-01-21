import 'package:cloud_firestore/cloud_firestore.dart';

class ProductManager {
  ProductManager() {
    _loadingAllProducts();
  }

  final Firestore firestore = Firestore.instance;

  Future<void> _loadingAllProducts() async {
    final QuerySnapshot snapProducts =
        await firestore.collection('products').getDocuments();
    for(DocumentSnapshot doc in snapProducts.documents){
      print(doc.data);
    }
  }
}
