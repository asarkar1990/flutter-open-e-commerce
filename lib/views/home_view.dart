import 'package:flutter/material.dart';
import 'package:opencommerce/views/product_view.dart';

final List<String> products = ["Iphone Se", "Iphone XR", "Iphone 6"];

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Free Commerce"),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              var product = products[index];
              return ListTile(
                leading: Image.network(
                    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-se-black-select-2020?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1586574260051"),
                title: Text(product),
                subtitle: Text("Tiny iphone"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductView()),
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
