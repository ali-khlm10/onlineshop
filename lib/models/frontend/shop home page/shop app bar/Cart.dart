import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

Future Cart(BuildContext context, Size size) {
  List mylist = CartList;
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return ChangeNotifierProvider<CartProvider>(
        create: (_) => CartProvider(),
        child: Consumer<CartProvider>(
          builder: (context, value, child) => Container(
            // height: 200,
            margin: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .02,
            ),
            padding: EdgeInsets.symmetric(vertical: size.height * .02),
            // color: Color.fromRGBO(255, 193, 7, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    const Center(
                      child: Text(
                        'سبد خرید مشتری',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      height: size.height * .03,
                      margin: EdgeInsets.all(2),
                      padding: EdgeInsets.all(5),
                      color: Colors.amber,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('محصول'),
                          Text('قیمت'),
                          Text('حذف'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .32,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < mylist.length; i++) ...[
                          Container(
                            margin: EdgeInsets.all(2),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(CartList[i]['product']),
                                Text(CartList[i]['price']),
                                IconButton(
                                  onPressed: () {
                                    CartList.removeAt(i);
                                    value.getCartsList;
                                  },
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width / 3,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('پرداخت'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class Carts extends StatefulWidget {
  const Carts({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<Carts> createState() => _CartsState();
}

class _CartsState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('سبد خرید'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider<CartProvider>(
            create: (_) => CartProvider(),
            child: Consumer<CartProvider>(
              builder: (context, value, child) => Container(
                // height: 200,
                margin: EdgeInsets.symmetric(
                  horizontal: widget.size.width * .03,
                  vertical: widget.size.height * .02,
                ),
                padding:
                    EdgeInsets.symmetric(vertical: widget.size.height * .02),
                // color: Color.fromRGBO(255, 193, 7, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        const Center(
                          child: Text(
                            'سبد خرید مشتری',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Container(
                          height: widget.size.height * .05,
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(5),
                          color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('محصول'),
                              Text('قیمت'),
                              Text('حذف'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: widget.size.height * .65,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (CartList.isEmpty) ...[
                              Container(
                                margin: EdgeInsets.only(
                                    top: widget.size.height / 3),
                                child: const Center(
                                  child: Text('سبد خالی است'),
                                ),
                              ),
                            ] else ...[
                              for (var i = 0; i < CartList.length; i++) ...[
                                Container(
                                  margin: EdgeInsets.all(2),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(CartList[i]['product']),
                                      Text(CartList[i]['price']),
                                      IconButton(
                                        onPressed: () {
                                          CartList.removeAt(i);
                                          // value.getCartsList;
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width / 3,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('پرداخت'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
