import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:opencommerce/controllers/auth_controller.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';
import 'package:opencommerce/views/product_add_edit_form.dart';
import 'package:opencommerce/views/product_view.dart';
import 'package:opencommerce/views/wigets/cart_icon.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Free Commerce"),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                signOut();

              },
            ),
            CartIcon()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ProductAddEditView(Product())));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          child: StreamBuilder<List<Product>>(
            stream: ProductService().getProductStream(),
            builder: (context, snapShot) {
              if (snapShot.hasData &&
                  snapShot.connectionState != ConnectionState.done) {
                final List<Product> products = snapShot.data;
                return ListView.builder(
                  // itemCount: productController.products.length,
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product product = products[index];
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
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
