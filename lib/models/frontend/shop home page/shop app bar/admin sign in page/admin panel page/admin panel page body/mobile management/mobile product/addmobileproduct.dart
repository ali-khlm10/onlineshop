// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class addmobileproduct extends StatefulWidget {
  const addmobileproduct({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<addmobileproduct> createState() => _addmobileproductState();
}

class _addmobileproductState extends State<addmobileproduct> {
  List<TextEditingController>? controllers;
  List<String>? inputstext;
  List<String>? dropdownList;
  String? dropdownValue;

  /////////////
  void addcontrollers() {
    controllers = List.generate(
        mobiledetaillabels.length, (index) => TextEditingController());
  }

  void deletecontrollers() {
    // ignore: avoid_function_literals_in_foreach_calls
    controllers!.forEach((item) => item.clear());
  }

  void addinputstext() {
    inputstext = List.generate(
        mobiledetaillabels.length, (index) => controllers![index].text);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    addcontrollers();
    dropdownList = List.generate(
        list_mobile_cats.length, (index) => list_mobile_cats[index]['catName']);
    dropdownValue = dropdownList!.first;
    super.initState();
  }

  Widget retuenRow(int index, String text) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Transform.scale(
            scale: 0.8,
            child: TextField(
              controller: controllers![index],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, provider, child) => Container(
        margin: EdgeInsets.symmetric(
          vertical: widget.size.height * .05,
        ),
        height: widget.size.height * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: widget.size.height * .7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 28),
                            height: widget.size.width * .06,
                            width: widget.size.width * .2,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.grey,
                            )),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                alignment: Alignment.center,
                                // isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 5,
                                onChanged: (String? newvalue) {
                                  setState(() {
                                    dropdownValue = newvalue!;
                                  });
                                },
                                items: dropdownList!
                                    .map<DropdownMenuItem<String>>(
                                        (String textvalue) {
                                  return DropdownMenuItem<String>(
                                    value: textvalue,
                                    child: Text(textvalue),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text(
                            '?????? ????????',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (var i = 0; i < mobiledetaillabels.length; i++) ...[
                      retuenRow(i, mobiledetaillabels[i])
                    ]
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      provider.changeproductmanagementbody(widget.size);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text('????????????'),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      addinputstext();
                      try {
                        await addMobile(
                          Mobile(
                            name: controllers![0].text,
                            catId: list_mobile_cats[
                                dropdownList!.indexOf(dropdownValue!)]['catId'],
                            catName: list_mobile_cats[dropdownList!
                                .indexOf(dropdownValue!)]['catName'],
                            productId: int.parse(controllers![1].text),
                            picAddress: controllers![2].text,
                            weight: controllers![3].text,
                            color: controllers![4].text,
                            battery: controllers![5].text,
                            internalStorage: controllers![6].text,
                            frontCameraResolution: controllers![7].text,
                            backCameraResolution: controllers![8].text,
                            explain: controllers![9].text,
                            price: controllers![10].text,
                            stock: int.parse(controllers![11].text),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }

                      list_of_products_for_mobile = await getAllMobiles();

                      deletecontrollers();
                      provider.changeproductmanagementbody(widget.size);

                      setState(() {});
                      provider.listofmainpagesubjects();
                      provider.updateshowListformainpage();
                      provider.showAllmobileformainpage();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('??????????'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
