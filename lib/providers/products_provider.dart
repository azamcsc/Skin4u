import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customers_app/model/products_model.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider with ChangeNotifier {
  static List<ProductModel> _productsList = [];

  List<ProductModel> get getProducts {
    return _productsList;
  }

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _productsList = [];
      productSnapshot.docs.forEach((element) {
        _productsList.insert(
            10,
            ProductModel(
              id: element.get('id'),
              title: element.get('title'),
              description: element.get('description'),
              imageUrl: element.get('imageUrl'),
              price: element.get('price'),
            ));
      });
    });
    notifyListeners();
  }

  ProductModel findProdById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }
}
