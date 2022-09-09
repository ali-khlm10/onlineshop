import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/order_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

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
          child: ChangeNotifierProvider<listofcategorysubjectProvider>(
            create: (_) => listofcategorysubjectProvider(),
            child: Consumer<listofcategorysubjectProvider>(
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
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            CartList[i]['name'],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            CartList[i]['price'],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            CartList.removeAt(i);
                                            value.updateCartList();
                                            DBCartList.removeAt(i);
                                            print(CartList);
                                            print(DBCartList);

                                            setState(() {});
                                          },
                                          icon: Icon(Icons.delete),
                                          color: Colors.red,
                                        ),
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
                        onPressed: () async {
                          print(CartList);
                          print(DBCartList);
                          // print(DBCartList);
                          // for (var i = 0; i < DBCartList.length; i++) {
                          //   print(DBCartList[i].productId);
                          // }
                          await addOrders(DBCartList);
                          DBCartList.clear();
                          CartList.clear();

                          Navigator.pop(context);
                        },
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
