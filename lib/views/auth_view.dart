import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:opencommerce/controllers/product_controller.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/services/product_service.dart';
import 'package:opencommerce/views/home_view.dart';
import 'package:opencommerce/views/product_add_edit_form.dart';
import 'package:opencommerce/views/product_view.dart';
import 'package:opencommerce/views/sign_in.dart';
import 'package:opencommerce/views/wigets/cart_icon.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final ProductController productController = ProductController();

  @override
  void initState() {
    loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          var user = snapshot.data;
          if (user == null) {
            return SignInView();
          } else {
            return HomeView();
          }
        }
      },
    );
  }

  void loadData() async {
    await productController.getProducts();
    setState(() {});
  }
}
