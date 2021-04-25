import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class PriceDetails extends StatefulWidget {
  final List<Product> products;

  PriceDetails(this.products);

  @override
  _PriceDetailsState createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {
  double totalPrice;
  double counter = 1;
  double delivery = 25.0;
  double netAmount;

  double _getTotalPrice() {
    double total = 0.0;
    for (Product product in widget.products) {
      total = total + product.price;
    }
    return total;
  }

  @override
  void initstate() {
    totalPrice = _getTotalPrice();
    netAmount = totalPrice + delivery;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.greenAccent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Price Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Price(${widget.products.length} item)'),
                  Text('₹999')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Discount'),
                  Text('10%', style: TextStyle(color: Colors.green))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Delivery Charges'), Text('₹25')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('$netAmount',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              Text('You are saving ₹99',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
