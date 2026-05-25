import 'package:flutter/material.dart';
import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final ProductController controller = ProductController();

  @override
  Widget build(BuildContext context) {
    List<Product> products = controller.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text("₹${products[index].price}"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                controller.navigateToDetail(
                  context,
                  products[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}