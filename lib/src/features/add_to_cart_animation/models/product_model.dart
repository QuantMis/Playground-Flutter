import 'package:flutter/material.dart';

class ProductModel {
  String title;
  String price;
  ProductModel(this.title, this.price);

  static List<ProductModel> productList() {
    List<ProductModel> productList = [];
    productList.add(ProductModel("Item 1", "10RM"));
    productList.add(ProductModel("Item 2", "10RM"));
    productList.add(ProductModel("Item 3", "10RM"));
    return productList;
  }
}
