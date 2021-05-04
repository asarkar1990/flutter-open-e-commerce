import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/controllers/auth_controller.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';
import 'package:opencommerce/views/product_add_edit_form.dart';
import 'package:opencommerce/views/product_view.dart';
import 'package:opencommerce/views/profile_add_edit_view.dart';
import 'package:opencommerce/views/profile_view.dart';
import 'package:opencommerce/views/wigets/cart_icon.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final ProductController productController = ProductController();
  //
  // _HomeViewState() {
  //   // Get.put(ProductController());
  // }

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
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.grey,
                child: SizedBox(
                  height: 150.0,
                  child: Icon(
                    Icons.person,
                    size: 60.0,
                  ),
                ),
              ),
              ListTile(
                title: Text("Profile"),
                onTap: () async {
                  Profile _profile;

                  /// fetch profile from firebase if exist
                  final user = FirebaseAuth.instance.currentUser;
                  DocumentSnapshot doc;
                  try {
                    doc = await FirebaseFirestore.instance
                        .collection("profiles")
                        .doc(user.uid)
                        .get();
                  } catch (e) {}
                  if (doc != null && doc.exists) {
                    _profile = Profile.fromMap(doc.data());
                  }

                  if (_profile != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileView(_profile)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileAddEditView()));
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var controller = Get.find<ProductController>();

            controller.increment();

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             ProductAddEditView(Product()))
            // );
          },
          child: Icon(Icons.add),
        ),
        // body: Container(
        //     child: ListView.builder(
        //   itemCount: productController.products.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     Product product = productController.products[index];
        //     return ListTile(
        //       leading: Image.network(product.imageUrl),
        //       title: Text(product.name),
        //       subtitle: Text("${product.price}"),
        //       onTap: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(
        //         //       builder: (context) => ProductView(product)),
        //         // );
        //         /// Navigation using Get.to()
        //         Get.to(ProductView(product));
        //       },
        //     );
        //   },
        // )),
        // body: Center(child: Text("${productController.count}"))
        body: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (controller) {
            return Center(child: Text("${controller.count}"));
          },
        ),
      ),
    );
  }
}
