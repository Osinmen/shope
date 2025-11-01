import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class ProductModel {
  final String? title;
  final String? description;
  final String? networkImageurl;

  ProductModel({
    required this.title,
    required this.description,
    required this.networkImageurl,
  });
//this is the Productmodel that maps the image and convert from one form to another
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json["title"],
      description: json["description"],
      networkImageurl: json["image"],
    );
  }
}
