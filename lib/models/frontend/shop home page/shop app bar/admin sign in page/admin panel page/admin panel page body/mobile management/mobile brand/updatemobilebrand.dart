import 'package:flutter/material.dart';
import 'package:onlineshop/models/backend/Sqlite%20Functions/mobile_cat_funcs.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class updatemobilebrand extends StatefulWidget {
  const updatemobilebrand(
      {Key? key,
      required this.size,
      required this.inputforupdate,
      required this.Index})
      : super(key: key);
  final Size size;
  final String inputforupdate;
  final int Index;

  @override
  State<updatemobilebrand> createState() => _updatemobilebrandState();
}

class _updatemobilebrandState extends State<updatemobilebrand> {
  TextEditingController mobilebrandcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    mobilebrandcontroller.text = widget.inputforupdate;
    super.initState();
  }

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
                    onPressed: () async {
                      // listofmobilecategory.remove(widget.inputforupdate);
                      // listofmobilecategory.insert(
                      //     widget.Index, mobilebrandcontroller.text);
                      await editMobileCategory(
                          widget.Index, mobilebrandcontroller.text);
                      list_mobile_cats = await getAllMobileCats();
                      print(widget.Index);
                      print(widget.inputforupdate);

                      print(list_mobile_cats);
                      value.changebrandsmanagementbody(widget.size);
                      value.listofmainpagesubjects();
                      value.updateshowListformainpage();
                      value.showAllmobileformainpage();
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
