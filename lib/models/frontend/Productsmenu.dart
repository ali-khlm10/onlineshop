import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class productsmenu extends StatefulWidget {
  const productsmenu({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<productsmenu> createState() => _productsmenuState();
}

class _productsmenuState extends State<productsmenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Expanded(
        flex: 2,
        child: Container(
          // margin: const EdgeInsets.only(top: 10),
          color: Colors.green[50],
          height: widget.size.height * .52,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      value.getmenuname,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                for (var i = 0;
                    i < value.getlistofcategorysubject.length;
                    i++) ...[
                  Container(
                    // height: 30,
                    color: Colors.green[300],
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Text(
                          value.getlistofcategorysubject[i],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
