import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class productsmanagement extends StatefulWidget {
  const productsmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<productsmanagement> createState() => _productsmanagementState();
}

// ignore: camel_case_types
class _productsmanagementState extends State<productsmanagement> {
  List<bool> allcheckboxvalue = [];
  int selectedIndex = -1;

  void addvalidator() {
    for (var i = 0; i < list_of_products_for_mobile.length; i++) {
      allcheckboxvalue.add(false);
    }
  }

  @override
  void initState() {
    addvalidator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.size.width * .05,
              vertical: widget.size.height * .05,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedIndex == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      '!!لطفایکی از سطرها را انتخاب کنید',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.red[200],
                              ),
                            );
                          } else {
                            value.changeupatemobileproductmanagementbody(
                              widget.size,
                              selectedIndex,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                        ),
                        child: const Text('تغییر'),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          deleteMobile(10);

                          if (selectedIndex == -1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      '!!لطفایکی از سطرها را انتخاب کنید',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.red[200],
                              ),
                            );
                          } else {
                            await deleteMobile(
                                list_of_products_for_mobile[selectedIndex]
                                    ['productId']);

                            list_of_products_for_mobile = await getAllMobiles();
                            selectedIndex = -1;
                            allcheckboxvalue.clear();
                            addvalidator();
                          }
                          setState(() {});
                        },
                        child: const Text('حذف'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (list_mobile_cats.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'لطفااز بخش مدیریت برند های موبایل یک برند جدید اضافه کنید',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                backgroundColor: Colors.red[200],
                              ),
                            );
                          } else {
                            value.changeaddmobileproductmanagementbody(
                                widget.size);
                          }
                        },
                        child: const Text('اضافه'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.blue[800],
                        padding:
                            const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        alignment: Alignment.center,
                        child: const Text(
                          'نام محصول',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        color: Colors.blue[500],
                        padding:
                            const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        alignment: Alignment.center,
                        child: const Text(
                          'نام برند',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.blue[800],
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                        child: const Text(
                          'ردیف',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  // color: Colors.yellow,
                  height: widget.size.height * .4,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (list_of_products_for_mobile.isEmpty) ...[
                          SizedBox(
                            height: widget.size.height * .4,
                            child: const Center(
                              child: Text('. آیتمی وجود ندارد'),
                            ),
                          )
                        ] else ...[
                          for (var i = 0;
                              i < list_of_products_for_mobile.length;
                              i++) ...[
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: (allcheckboxvalue[i])
                                    ? Colors.red[50]
                                    : Colors.blue[50],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(list_of_products_for_mobile[i]
                                          ['name']),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        list_mobile_cats[
                                            list_of_products_for_mobile[i]
                                                ['catId']]['catName'],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      // color: Colors.red,
                                      alignment: Alignment.center,
                                      height: 15,
                                      child: Transform.scale(
                                        scale: 0.75,
                                        child: Checkbox(
                                          onChanged: (bool? newvalue) {
                                            setState(() {
                                              allcheckboxvalue.clear();
                                              addvalidator();
                                              allcheckboxvalue[i] = newvalue!;
                                              selectedIndex = allcheckboxvalue
                                                  .indexOf(true);
                                              // ignore: avoid_print
                                              print(allcheckboxvalue);
                                              print(allcheckboxvalue
                                                  .indexOf(true));
                                            });
                                          },
                                          value: allcheckboxvalue[i],
                                          // shape: OutlineInputBorder.,
                                          splashRadius: 12,
                                          activeColor: Colors.red,
                                          shape: const CircleBorder(),
                                        ),
                                      ),
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
              ],
            ),
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                value.changemobilemanagementbody(widget.size);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text('بازگشت'),
            ),
          ),
        ],
      ),
    );
  }
}
