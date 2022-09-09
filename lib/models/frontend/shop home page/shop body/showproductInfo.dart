import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/order_funcs.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20body/body%20under%20of%20search%20widget/Showproducts.dart';
import 'package:provider/provider.dart';

class showProductInfo extends StatefulWidget {
  const showProductInfo({Key? key, required this.size, required this.Index})
      : super(key: key);
  final Size size;
  final int Index;
  @override
  State<showProductInfo> createState() => _showProductInfoState();
}

class _showProductInfoState extends State<showProductInfo> {
  int picture(String str) {
    return pictures.indexOf(str);
  }

  ///////
  Widget returnContainer(String text_1, String text_2) {
    return Container(
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(text_1),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                text_2,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
          height: widget.size.height * .52,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[200],
                  ),
                  // height: 50,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          (picture(value.getshowList[widget.Index]
                                      ['picAddress']) !=
                                  -1)
                              ? 'assets/images/${value.getshowList[widget.Index]['picAddress']}'
                              : 'assets/images/camera_1.jpg',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['name'],
                        ': نام محصول',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['catName'],
                        ': نام برند',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['productId'].toString(),
                        ': کد محصول',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['weight'],
                        ': وزن محصول',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['color'],
                        ': رنگ محصول',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['battery'],
                        ': باتری',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['internalStorage'],
                        ': حافظه داخلی',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]
                            ['frontCameraResolution'],
                        ': دوربین جلو',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['backCameraResolution'],
                        ': دوربین عقب',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['explain'],
                        ': توضیحات',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['price'],
                        ': قیمت',
                      ),
                      returnContainer(
                        value.getshowList[widget.Index]['stock'].toString(),
                        ': تعداد',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          CartList.add(value.getshowList[widget.Index]);
                          DBCartList.add(
                            Order(
                              orderId: await lastNum(),
                              productId: value.getshowList[widget.Index]
                                  ['productId'],
                            ),
                          );

                          value.updateCartList();
                          value.changeProductMenu(showproducts());

                          print(CartList);
                          print(DBCartList);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                        ),
                        child: const Text('افزودن به سبد'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
