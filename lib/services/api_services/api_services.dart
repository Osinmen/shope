import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {


  Future<void> fetchProducts() async {
    const String baseUrl = "https://fakestoreapi.com/products";
    
    final url = Uri.parse(baseUrl);

    //gets  response
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final  List<dynamic> data = jsonDecode(response.body);
      final products = List<Map<String, dynamic>>.from(data);
      print(data);
    }
  }
}
