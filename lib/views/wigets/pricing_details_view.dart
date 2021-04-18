import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';

class PricingView extends StatefulWidget {
  final List<Product> products;

  PricingView(this.products);

  @override
  _PricingViewState createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  double totalPrice;
  int counter = 1;
  double delivery = 25.0;
  double netAmount;

  double _getTotalPrice() {
    print("Method is called $counter times");
    counter++;
    double total = 0.0;
    for (Product product in widget.products) {
      total += product.price;
    }
    return total;
  }

  @override
  void initState() {
    totalPrice = _getTotalPrice();
    netAmount = totalPrice + delivery;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuilding");
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.blueAccent,
      child: Column(
        children: [
          Text(
            'Price Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Price(${widget.products.length} item)'),
              Text("$totalPrice")
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Text('Discount'),
          //     Text('10%', style: TextStyle(color: Colors.green))
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Delivery Charges'), Text('₹$delivery')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('₹$netAmount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
          // Text('You are saving ₹99',
          //     style: TextStyle(
          //         fontSize: 15,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.green)),
        ],
      ),
    );
  }
}
