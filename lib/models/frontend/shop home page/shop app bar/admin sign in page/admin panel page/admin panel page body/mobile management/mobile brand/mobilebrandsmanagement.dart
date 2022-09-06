import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_cat_funcs.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:onlineshop/models/frontend/shop%20home%20page/shop%20app%20bar/admin%20sign%20in%20page/admin%20panel%20page/admin%20panel%20page%20body/mobile%20management/mobile%20brand/addmobilebrand.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class brandsmanagement extends StatefulWidget {
  const brandsmanagement({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<brandsmanagement> createState() => _brandsmanagementState();
}

// ignore: camel_case_types
class _brandsmanagementState extends State<brandsmanagement> {
  List<bool> allcheckboxvalue = [];
  int selectedIndex = -1;

  void addvalidator() {
    for (var i = 0; i < list_mobile_cats.length; i++) {
      allcheckboxvalue.add(false);
    }
  }

  @override
  void initState() {
    addvalidator();
    super.initState();
  }

  // Future<void> saveListofmobilebrands() async {
  //   list_mobile_cats = await getAllMobileCats();
  // }

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
                            value.changeupatemobilebrandsmanagementbody(
                              widget.size,
                              list_mobile_cats[selectedIndex]['catName'],
                              list_mobile_cats[selectedIndex]['catId'],
                            );
                          }
                        },
                        child: const Text('تغییر'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
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
                            // listofmobilecategory.removeAt(selectedIndex);
                            print(
                                'ghvmhvmjh${list_mobile_cats[selectedIndex]["catId"]}');
                            deleteMobileCategory(
                                list_mobile_cats[selectedIndex]['catId']);
                            list_mobile_cats = await getAllMobileCats();
                            print(list_mobile_cats);
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
                          value
                              .changeaddmobilebrandsmanagementbody(widget.size);
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
                SizedBox(
                  // color: Colors.yellow,
                  height: widget.size.height * .4,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (list_mobile_cats.isEmpty) ...[
                          SizedBox(
                            height: widget.size.height * .4,
                            child: const Center(
                              child: Text('. آیتمی وجود ندارد'),
                            ),
                          ),
                        ] else ...[
                          for (var i = 0; i < list_mobile_cats.length; i++) ...[
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
                                    child: Text(list_mobile_cats[i]['catName']),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      // color: Colors.red,
                                      alignment: Alignment.centerLeft,
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
                                          splashRadius: 15,
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
