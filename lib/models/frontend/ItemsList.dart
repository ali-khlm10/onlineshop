import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:onlineshop/models/frontend/constants.dart';
import 'package:onlineshop/models/frontend/provider.dart';
import 'package:provider/provider.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Itemslist extends StatefulWidget {
  const Itemslist({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<Itemslist> createState() => _ItemslistState();
}

class _ItemslistState extends State<Itemslist> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listofCategories.length,
          controller: controller,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                color: Colors.teal,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Consumer<listofcategorysubjectProvider>(
                  builder: (context, value, child) => InkWell(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    onTap: () {
                      if (index == 0) {
                        value.listofmobilesubjects();
                      } else if (index == 1) {
                        value.listofcamerasubjects();
                      } else if (index == 2) {
                        value.listofhomeappliancessubjects();
                      } else if (index == 3) {
                        value.listofcomputersubjects();
                      }
                    },
                    child: SizedBox(
                      width: widget.size.width * .2,
                      child: Center(
                        child: Text(
                          listofCategories[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          reverse: true,
          padding: const EdgeInsets.only(top: 20),
        ),
      ),
    );
  }
}
