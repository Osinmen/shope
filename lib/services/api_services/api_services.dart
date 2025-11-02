import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shope/models/product_model.dart';

class ApiServices {
  Future<List<ProductModel>> fetchProducts() async {
    String url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      final products = data.map((json) => ProductModel.fromJson(json)).toList();
      return products;
    } else {
      throw Exception("please try again something occured");
    }
  }
}
