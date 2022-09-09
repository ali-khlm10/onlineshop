import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/order_funcs.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class sellmanagement extends StatefulWidget {
  const sellmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<sellmanagement> createState() => _sellmanagementState();
}

class _sellmanagementState extends State<sellmanagement> {
  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(
            horizontal: widget.size.width * 0.02,
            vertical: widget.size.height * .08),
        child: Column(
          children: [
            const Text('کالاهای ثبت شده مشتریان'),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blue[300],
                    child: Text('نام محصول'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blue[800],
                    child: Text('نام برند'),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.blue[300],
                    child: Text('قیمت'),
                  ),
                ),
              ],
            ),
            for (var i = 0; i < value.getIndex; i++) ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 2),

                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(value.getsellorders[i][0]['name']),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(value.getsellorders[i][0]['catName']),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(value.getsellorders[i][0]['price']),
                      ),
                    ),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
