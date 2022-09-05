import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';

class addmobileproduct extends StatefulWidget {
  const addmobileproduct({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<addmobileproduct> createState() => _addmobileproductState();
}

class _addmobileproductState extends State<addmobileproduct> {
  Widget retuenRow() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Transform.scale(
            scale: 0.9,
            child: TextField(
              // controller: mobilebrandcontroller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Center(
            child: Text('نام برند'),
          ),
        ),
      ],
    );
  }

  String dropdownValue = listofmobilecategory.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      margin: EdgeInsets.symmetric(
        horizontal: widget.size.width * .05,
        vertical: widget.size.height * .05,
      ),
      height: widget.size.height * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: widget.size.height * .7,
            color: Colors.red,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: widget.size.width * .06,
                    width: widget.size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 5,
                        // style: const TextStyle(color: Colors.deepPurple),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? newvalue) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = newvalue!;
                          });
                        },
                        items: listofmobilecategory
                            .map<DropdownMenuItem<String>>((String textvalue) {
                          return DropdownMenuItem<String>(
                            value: textvalue,
                            child: Text(textvalue),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Transform.scale(
                          scale: 0.9,
                          child: TextField(
                            // controller: mobilebrandcontroller,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text('نام برند'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // value.changebrandsmanagementbody(widget.size);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: const Text('بازگشت'),
          ),
        ],
      ),
    );
  }
}
