import 'dart:collection';
import 'package:flutter/cupertino.dart';

class Product {
  int? id;
  String? name;
}

class ProductProvider with ChangeNotifier {
  // Instance - Constructor
  static final ProductProvider _instance = ProductProvider._internal();

  factory ProductProvider() {
    return _instance;
  }

  ProductProvider._internal() {
    debugPrint('ProductProvider instance created');
  }

  // State - Attributes
  final List<Product> _productList = [
    Product()
      ..id = 1
      ..name = 'Test',
  ];

  UnmodifiableListView<Product> get productList => UnmodifiableListView(_productList);

  // Behavior (Зан төлөв)
  void add(Product? product) {
    if (product != null) {
      _productList.add(product);
      notifyListeners();
    }
  }

  void clear() {
    _productList.clear();
    notifyListeners();
  }
}
