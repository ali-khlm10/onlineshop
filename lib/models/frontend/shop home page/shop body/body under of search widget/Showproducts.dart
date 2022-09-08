import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/showproductInfo.dart';
import 'package:provider/provider.dart';

class showproducts extends StatefulWidget {
  const showproducts({Key? key}) : super(key: key);
  // final Size size;

  @override
  State<showproducts> createState() => _showproductsState();
}

class _showproductsState extends State<showproducts> {
  late Size size = MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Expanded(
        flex: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blueGrey[100],
          ),
          margin: const EdgeInsets.all(5),
          height: size.height * .52,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < value.getshowList.length; i++) ...[
                  Container(
                    height: size.height * .15,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/camera_1.jpg',
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.getshowList[i]['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            InkWell(
                              onTap: () {
                                value.changeProductMenu(showProductInfo(
                                  Index: i,
                                  size: size,
                                ));
                              },
                              child: const Text(
                                'اطلاعات بیشتر',
                                style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]

                // Container(
                //   color: Colors.yellow,
                //   height: 200,
                //   margin: EdgeInsets.all(5),
                // ),
                // Container(
                //   color: Colors.yellow,
                //   height: 200,
                //   margin: EdgeInsets.all(5),
                // ),
                // Container(
                //   color: Colors.yellow,
                //   height: 200,
                //   margin: EdgeInsets.all(5),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
