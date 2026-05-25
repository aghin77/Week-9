import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../views/product_detail_view.dart';

class ProductController {
  List<Product> getProducts() {
    return [
      Product(
        name: "Laptop",
        description: "High performance laptop",
        price: 50000,
      ),
      Product(
        name: "Phone",
        description: "Latest smartphone",
        price: 25000,
      ),
      Product(
        name: "Headphones",
        description: "Noise cancelling headphones",
        price: 5000,
      ),
    ];
  }

  void navigateToDetail(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailView(product: product),
      ),
    );
  }
}