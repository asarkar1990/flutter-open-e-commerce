import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Sign In With Google"),
            onPressed: () {
              signInWithGoogle();
            },
          )
        ],
      ),
    )));
  }
}
