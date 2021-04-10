import 'package:flutter/material.dart';
import 'package:opencommerce/main.dart';
import 'package:opencommerce/models/models.dart';

import 'wigets/cart_product_item.dart';

class CartView extends StatefulWidget {
  final List<Product> products;

  CartView(this.products);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) => CartItem(widget.products[index], () {
            setState(() {
              cart.removeProduct(widget.products[index]);
            });
          }),
        ),
      ),
    );
  }
}
