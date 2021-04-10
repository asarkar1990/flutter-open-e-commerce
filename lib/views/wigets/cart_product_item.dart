import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opencommerce/models/models.dart';

class CartItem extends StatelessWidget {
  final Product product;
  Function onRemove;

  CartItem(this.product, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name ?? '',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${product.price}",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => print(Text('hg')),
                    child: Text("Save For Later")),
                ElevatedButton(onPressed: onRemove, child: Text("Remove")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
