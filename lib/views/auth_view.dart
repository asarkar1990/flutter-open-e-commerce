import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Free Commerce",
                  style: TextStyle(fontSize: 40.0),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("SignIn With Google"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
