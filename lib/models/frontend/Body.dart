import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/ItemsList.dart';
import 'package:onlineshop/models/frontend/Productsmenu.dart';
import 'package:onlineshop/models/frontend/Showproducts.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          showproducts(size: widget.size),
          productsmenu(size: widget.size),
        ],
      ),
    );
  }
}
