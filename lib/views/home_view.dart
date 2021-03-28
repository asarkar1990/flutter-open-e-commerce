import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/new_product.dart';
import 'package:opencommerce/views/product_view.dart';
import 'package:opencommerce/views/profile_view.dart';
import 'package:opencommerce/widgets/cart_icon.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductController productController = ProductController();

  @override
  void initState() {
    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: false,
          title: Text(
            "Free Commerce",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [IconButton(icon: CartIcon(), onPressed: (){}),IconButton(icon: (Icon(Icons.description)), onPressed:(){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileView()),
          );})],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NewProduct()));
          },
        ),
        body: Container(
          child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) {
              Product product = productController.products[index];
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
        ),
      ),
    );
  }

  void loadData() async {
    await productController.getProducts();
    setState(() {});
  }
}
