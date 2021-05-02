import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/cart_service.dart';
import 'package:opencommerce/views/product_%20view.dart';

import 'checkout_view.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: StreamBuilder<List<Product>>(
          stream: CartService().getCartStream(),
          builder: (context, snapShot) {
            if (snapShot.hasError)
              return Text('Error,${snapShot.error}');
            else if (snapShot.hasData &&
                snapShot.connectionState != ConnectionState.waiting) {
              final List<Product> products = snapShot.data;
              return ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = products[index];
                      return Card(
                        color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // shadowColor: Colors.black,
                        margin: EdgeInsets.all(02),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: GestureDetector(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(product.name ?? ''),
                                          Text("₹${product.price.toString()}"),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductView(product)));
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      product.imageUrl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Cart')
                                      .doc(product.id)
                                      .delete();
                                },
                                child: Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.lime,
                    child: Column(
                      children: [
                        Text(
                          'Price Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Divider(
                          thickness: 6,
                          color: Colors.limeAccent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "₹${calculateTotal(products)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Charge',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              '₹0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red),
                            ),
                            Text(
                              "₹${totalAmount(products)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      child: Text('Place Order'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutView(products: [],)));
                      }),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ));
  }
}

double calculateTotal(List<Product> products) {
  var totalPrice = 0.0;

  for (Product product in products) {
    totalPrice += product.price;
  }
  return totalPrice;
}

double totalAmount(List<Product> products) {
  var totalAmount = 0.0;
  // ignore: unused_local_variable
  for (Product product in products) {
    totalAmount = calculateTotal(products);
  }
  return totalAmount;
}
