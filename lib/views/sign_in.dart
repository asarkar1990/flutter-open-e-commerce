import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Free Commerce",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Text("E-commerce Application"),
                SizedBox(height: 90.0,),
                ElevatedButton(
                  child: Text("Sign In With Google"),
                  onPressed: () {
                    signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
