import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/wigets/pricing_details_view.dart';

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
        body: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
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
            PricingView(products),
            ElevatedButton(
              child: Text("Place order"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
