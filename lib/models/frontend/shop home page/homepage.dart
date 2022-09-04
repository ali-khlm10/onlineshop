import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/Appbar.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/ItemsList.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Body.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/searchWidget.dart';
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
      body: ChangeNotifierProvider<listofcategorysubjectProvider>(
        create: (_) => listofcategorysubjectProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShopAppBar(size: size),
                search(size: size),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Itemslist(size: size),
                Body(size: size),
              ],
            ),
          ),
        ),
      ),
      // appBar: Appbar(context, size),
      // body: ChangeNotifierProvider(
      //   create: (_) => listofcategorysubjectProvider(),
      //   child: Body(size: size),
      // ),
    );
  }
}
