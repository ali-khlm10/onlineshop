import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/Appbar.dart';
import 'package:onlineshop/models/frontend/Body.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(context, size),
      body: ChangeNotifierProvider(
        create: (_) => listofcategorysubjectProvider(),
        child: Body(size: size),
      ),
    );
  }
}
