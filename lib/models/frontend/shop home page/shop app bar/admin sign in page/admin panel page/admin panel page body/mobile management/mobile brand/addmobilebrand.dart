import 'package:flutter/material.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class addmobilebrand extends StatefulWidget {
  const addmobilebrand({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<addmobilebrand> createState() => _addmobilebrandState();
}

class _addmobilebrandState extends State<addmobilebrand> {
  TextEditingController mobilebrandcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<listofcategorysubjectProvider>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: widget.size.width * .1,
          vertical: widget.size.height * .05,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Transform.scale(
                    scale: 0.9,
                    child: TextField(
                      controller: mobilebrandcontroller,
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
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      value.changebrandsmanagementbody(widget.size);
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
                      listofmobilecategory.add(mobilebrandcontroller.text);
                      value.changebrandsmanagementbody(widget.size);
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
