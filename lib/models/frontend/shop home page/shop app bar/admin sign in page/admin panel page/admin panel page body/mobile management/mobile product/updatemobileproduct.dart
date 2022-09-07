import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_func.dart';
import 'package:onlineshop/models/backend/classes.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class updatemobileproduct extends StatefulWidget {
  const updatemobileproduct({Key? key, required this.size, required this.Index})
      : super(key: key);
  final Size size;
  final int Index;

  @override
  State<updatemobileproduct> createState() => _updatemobileproductState();
}

class _updatemobileproductState extends State<updatemobileproduct> {
  List<TextEditingController>? controllers;
  List<String>? inputstext;
  String? dropdownValue;
  List<String>? dropdownList;

  void addcontrollers() {
    controllers = List.generate(
        mobiledetaillabels.length, (index) => TextEditingController());
  }

  void deletecontrollers() {
    controllers!.forEach((item) => item.clear());
  }

  void addinputstext() {
    inputstext = List.generate(
        mobiledetaillabels.length, (index) => controllers![index].text);
  }

  void initializeInputs() {
    dropdownList = List.generate(
        list_mobile_cats.length, (index) => list_mobile_cats[index]['catName']);
    dropdownValue =
        list_mobile_cats[list_of_products_for_mobile[widget.Index]['catId']]
            ['catName'];
    controllers![0].text = list_of_products_for_mobile[widget.Index]['name'];
    controllers![1].text =
        list_of_products_for_mobile[widget.Index]['productId'].toString();
    controllers![2].text =
        list_of_products_for_mobile[widget.Index]['picAddress'];
    controllers![3].text = list_of_products_for_mobile[widget.Index]['weight'];
    controllers![4].text = list_of_products_for_mobile[widget.Index]['color'];
    controllers![5].text = list_of_products_for_mobile[widget.Index]['battery'];
    controllers![6].text =
        list_of_products_for_mobile[widget.Index]['internalStorage'];
    controllers![7].text =
        list_of_products_for_mobile[widget.Index]['frontCameraResolution'];
    controllers![8].text =
        list_of_products_for_mobile[widget.Index]['backCameraResolution'];
    controllers![9].text = list_of_products_for_mobile[widget.Index]['explain'];
    controllers![10].text = list_of_products_for_mobile[widget.Index]['price'];
    controllers![11].text =
        list_of_products_for_mobile[widget.Index]['stock'].toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    addcontrollers();
    initializeInputs();
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
        // color: Colors.yellow,
        margin: EdgeInsets.symmetric(
          // horizontal: widget.size.width * .04,
          vertical: widget.size.height * .05,
        ),
        height: widget.size.height * .8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: widget.size.height * .7,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
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
                            'نام برند',
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
                    child: const Text('بازگشت'),
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      addinputstext();
                      print(controllers![0].text);
                      await editMobile(
                        Mobile(
                          name: controllers![0].text,
                          catId: list_mobile_cats[
                              dropdownList!.indexOf(dropdownValue!)]['catId'],
                          catName: list_mobile_cats[
                              dropdownList!.indexOf(dropdownValue!)]['catName'],
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
                      // print(list_of_products_for_mobile);
                      // print('////////////////////////////////////');
                      list_of_products_for_mobile = await getAllMobiles();
                      // print(list_of_products_for_mobile);
                      deletecontrollers();
                      provider.changeproductmanagementbody(widget.size);

                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('انجام'),
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
