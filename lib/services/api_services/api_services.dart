import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shope/models/product_model.dart';

class ApiServices {
  Future<List<ProductModel>> fetchProducts() async {
    const String url = "https://fakestoreapi.com/products";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      // ✅ 1. Decode the JSON response
      final List<dynamic> data = jsonDecode(response.body);

      // ✅ 2. Map each JSON object into a ProductModel
      final List<ProductModel> products =
          data.map((item) => ProductModel.fromJson(item)).toList();

      // ✅ 3. Return the strongly-typed list
      return products;
    } else {
      throw Exception("❌ Failed to load products (status: ${response.statusCode})");
    }
  }
}
