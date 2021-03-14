import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

import 'product_view.dart';

class CheckoutView extends StatelessWidget {
  final List<Product> products;

  CheckoutView({@required this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              Product product = products[index];
              return ListTile(
                leading: Image.network(product.imageUrl),
                title: Text(product.name),
                subtitle: Text("${product.price}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductView(product)),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
