import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    addcontrollers();
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

  String dropdownValue = listofmobilecategory.first;
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
                                items: listofmobilecategory
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
                    onPressed: () {
                      addinputstext();
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
