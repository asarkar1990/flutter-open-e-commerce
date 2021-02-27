import 'package:flutter/material.dart';
import 'package:opencommerce/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter e-commerce',

      // home: AuthView(),
      home: HomeView(),
    );
  }
}
