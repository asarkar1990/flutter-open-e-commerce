import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView(this.product);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Product"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                product.imageUrl,
                height: 300.0,
              ),
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                product.inStock ? 'In-Stock' : 'Out of stock',
                style: TextStyle(
                    color: product.inStock ? Colors.green : Colors.red),
              ),
              Text(product.description),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Add to Cart')),
                  ElevatedButton(onPressed: () {}, child: Text('Buy')),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
