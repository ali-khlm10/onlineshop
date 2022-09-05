import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
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
    for (var i = 0; i < listofmobilecategory.length; i++) {
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
                            value.changeupatebrandsmanagementbody(
                              widget.size,
                              listofmobilecategory[selectedIndex],
                              selectedIndex,
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
                            listofmobilecategory.removeAt(selectedIndex);
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
                          value.changeaddbrandsmanagementbody(widget.size);
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
                        if (listofmobilecategory.isEmpty) ...[
                          SizedBox(
                            height: widget.size.height * .4,
                            child: const Center(
                              child: Text('. آیتمی وجود ندارد'),
                            ),
                          )
                        ] else ...[
                          for (var i = 0;
                              i < listofmobilecategory.length;
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
                                    child: Text(listofmobilecategory[i]),
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
