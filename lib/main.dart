import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencommerce/controllers/cart_controller.dart';
import 'package:opencommerce/counter_view.dart';
import 'package:opencommerce/views/auth_view.dart';
import 'package:opencommerce/views/home_view.dart';

import 'counter_controller.dart';

final cart = CartController();

void main() {
  runApp(MyApp());
  final _ = Get.put(CounterController());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool initialized = false;

  @override
  void initState() {
    initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter e-commerce',
      home: initialized
          ? CounterView()
          : Center(child: CircularProgressIndicator()),
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    setState(() {
      initialized = true;
    });
  }
}
