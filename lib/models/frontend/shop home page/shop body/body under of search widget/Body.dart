import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Productsmenu.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';
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
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            // showproducts(size: widget.size),
            value.getProductMenu,
            productsmenu(size: widget.size),
          ],
        ),
      ),
    );
  }
}
