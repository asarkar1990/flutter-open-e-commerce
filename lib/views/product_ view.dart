import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/main.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/checkout_view.dart';
import 'package:opencommerce/views/product_add_edit_form.dart';
import 'package:opencommerce/views/widget/cart_icon.dart';

class ProductView extends StatefulWidget {
  final Product product;

  ProductView(this.product);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.product.name}"),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductAddEditView(widget.product)),
                );
                setState(() {});
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                widget.product.imageUrl,
                height: 300.0,
              ),
              Text(
                widget.product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.product.inStock ? 'In-Stock' : 'Out of stock',
                style: TextStyle(
                    color: widget.product.inStock ? Colors.green : Colors.red),
              ),
              Text(widget.product.description,style: TextStyle(fontSize: 20),),
              SizedBox(),
              Text(
                "Price: Rs ${widget.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Builder(
                    builder: (context) => ElevatedButton(
                        onPressed: () {
                          var product = widget.product;
                          if (product.id != null){
                            FirebaseFirestore.instance
                                .collection("Cart")
                                .doc(product.id)
                                .set(product.toMap(), SetOptions(merge: true));
                          }
                          // cart.products.add(widget.product);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('${widget.product.name} added to the cart'),
                            duration: Duration(seconds: 5),
                          ));
                        },
                        child: Text('Add to Cart')),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutView(
                                      products: [widget.product],
                                    )));
                      },
                      child: Text('Buy')),
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
