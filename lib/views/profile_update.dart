import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'widget/profile_model.dart';

class ProfileUpdate extends StatefulWidget {
  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  Profile profile = Profile();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Profile Update"),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    /**/
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: "Name"),
                      onSaved: (value) => profile.name = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: "E-mail"),
                      onSaved: (value) => profile.email = value,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(20))),
                    //       labelText: "D.O.B"),
                    //
                    //   keyboardType: TextInputType.number,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        labelText: "Phone No.",
                      ),
                      onSaved: (value) => profile.phone = value,
                      keyboardType: TextInputType.number,
                    ),
                    // TextFormField()
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              var form = _form.currentState;
                              if (form.validate()) {
                                form.save();

                                /// save to the database
                                ///
                                ///

                                FirebaseFirestore.instance
                                    .collection("profiles")
                                    .doc(profile.email)
                                    .set(profile.toMap());
                              }
                            },
                            child: Text("Submit")))
                  ],
                ),
              ),
            )));
  }
}
