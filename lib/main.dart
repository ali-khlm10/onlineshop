import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: homePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
