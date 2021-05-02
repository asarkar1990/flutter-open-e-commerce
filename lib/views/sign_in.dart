import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/controllers/auth_controller.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_add_edit_view.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Open E-commerce ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            width: 300,
            child: ElevatedButton(
              child: Image(
                  image: AssetImage('images/sing up with google button.png')),
              onPressed: () {
                signInWithGoogle();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Don't Have An Account?",
            style: TextStyle(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            child: Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileAddEditView()));
            },
          ),
        ],
      ),
    )));
  }
}
