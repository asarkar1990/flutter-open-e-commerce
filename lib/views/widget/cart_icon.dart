import 'package:flutter/material.dart';
import 'package:opencommerce/main.dart';
import 'package:opencommerce/views/cart_view.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => CartView(cart.products)),
        );
      },
      icon: Icon(Icons.add_shopping_cart),
    );
  }
}