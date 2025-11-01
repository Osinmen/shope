import 'package:flutter/material.dart';
import 'package:shope/models/product_model.dart';
import 'package:shope/services/api_services/api_services.dart';

class ProductApiProvider extends ChangeNotifier{

  List<ProductModel> _products = [];
  bool _isLoading = false;
  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  Future<void> fetchProduct() async{
    try {
      _isLoading = true;
      notifyListeners();
      final List<ProductModel> fetchedProduct = await ApiServices().fetchProducts();
      _products = fetchedProduct;
    } catch(error) {
      debugPrint("Error getting product: $error");
    }finally {
      _isLoading  = false;
  notifyListeners();
    }
  } 
}