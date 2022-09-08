import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';
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
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green[300],
                      child: InkWell(
                        onTap: () async {
                          // print(value.getmenuname);
                          // print(value.getlistofcategorysubject);
                          // print(i);
                          if (value.getmenuname == 'صفحه اصلی' && i == 0) {
                            value.showAllmobileformainpage();
                            value.changeProductMenu(showproducts());
                          } else {
                            showProductsforMobile = await getBrandMobile(
                                value.getlistofcategorysubject[i]);
                            value.updateshowListformobile();

                            value.changeProductMenu(showproducts());
                            print(showProductsforMobile);
                          }
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
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
