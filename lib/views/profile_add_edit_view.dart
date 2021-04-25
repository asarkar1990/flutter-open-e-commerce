import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_view.dart';

class ProfileAddEditView extends StatelessWidget {
  Profile profile = Profile();

  ProfileAddEditView({this.profile});

  /// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                var form = _formKey.currentState;

                ///
                /// 1. Validate the form data by calling form.validate()
                if (form.validate()) {
                  /// 2. Save the form fields value by calling form.save()
                  form.save();

                  /// 3. Save data to the server/ database by calling service.save()
                  /// get firebase auth uid
                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    try {
                      await FirebaseFirestore.instance
                          .collection("profiles")
                          .doc(user.uid)
                          .set(profile.toMap());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(profile)));
                    } catch (e) {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Sorry! something went wrong'));

                      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {}
                }
              },
            )
          ],
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: profile.name,
                  decoration: InputDecoration(labelText: "Full Name"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your name" : null,
                  onSaved: (value) => profile.name = value,
                ),
                TextFormField(
                  initialValue: profile.email,
                  decoration: InputDecoration(labelText: "Email Id"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your email Id" : null,
                  onSaved: (value) => profile.email = value,
                ),
                TextFormField(
                  initialValue: profile.mobileNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  validator: (value) =>
                  value.isEmpty ? "Please enter your mobile number" : null,
                  onSaved: (value) => profile.mobileNumber = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}