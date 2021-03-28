import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Profile {
  String name;
  String dob;
  String email;
  String phone;

  Profile({this.name, this.dob, this.email, this.phone});

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
        name: map['name'],
        dob: map['dob'],
        email: map['email'],
        phone: map['phone']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'dob': dob, 'email': email, 'phone': phone};
  }
}

void main() {
  /// crate a profile object
  Profile p1 = Profile(
      name: 'Rahul',
      dob: '24/10/98',
      email: 'rahul716@gmail.com',
      phone: '8794414390');

  /// call toMap()
  var map = p1.toMap();
  print(map);

  var p2 = Profile.fromMap(map);
  print(p2.toMap());
}
