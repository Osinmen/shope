import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shope/models/product_model.dart';
import 'package:shope/services/api_services/api_services.dart';

class ProductApiProvider extends ChangeNotifier {

  List<ProductModel> _products = [];
  bool _isLoading = false;
  String _error = '';

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String get error => _error;

    Future<void> fetchProducts() async{
      _isLoading = true;
      notifyListeners();
        try {
          final fetchedProducts  = await ApiServices().fetchProducts();
          _products = fetchedProducts;
        } catch (e) {
          _error = "Error: $e";
        }
        _isLoading = false;
        notifyListeners();
    }

      List<ProductModel> get randomRecentlyViewed {
    if (_products.isEmpty) return [];
    final random = Random();
    final shuffled = List<ProductModel>.from(_products)..shuffle(random);
    return shuffled.take(8).toList();
  }

  List<ProductModel> get newlyAddedItems {
    if(_products.isEmpty) return [];
    final random = Random();
    final shuffled = List<ProductModel>.from(_products)..shuffle(random);
    return shuffled.take(10).toList();
  }

}