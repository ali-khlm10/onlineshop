import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/ItemsList.dart';
import 'package:onlineshop/models/frontend/Productsmenu.dart';
import 'package:onlineshop/models/frontend/Showproducts.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Itemslist(size: widget.size),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              showproducts(size: widget.size),
              productsmenu(size: widget.size),
            ],
          ),
        ],
      ),
    );
  }
}
